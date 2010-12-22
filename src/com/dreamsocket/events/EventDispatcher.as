//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.


import com.dreamsocket.events.Event;
import com.dreamsocket.events.IEventDispatcher;
import com.dreamsocket.events.EventPhase;

/**
 * EventDispatcher class defines methods for adding or removing event listeners, checks whether specific types of event listeners are registered, and dispatches events.
 * 
 * <p>
 * EventDispatcher is meant to serve as an ActionScript 2 implementation of the native ActionScript 3 class. Since some functionality is not 
 * present in the ActionScript 2 AVM1, certain elements like automatic closures are not available. This manifest itself in the form of an extra parameter
 * in addEventListener and removeEventListener calls which scopes the function handlers. In addition, because some systems (like Adobe's Flash AS2 components) 
 * use a similar Event framework, this implementation allows AS2 style addEventListener and removeEventListener calls as well. Therefore, this EventDispatcher 
 * can be used to replace legacy EventDispatchers, adding new functionality without breaking old usage.
 * </p>
 * 
 * <p>
 * In general, the easiest way for a user-defined class to gain event dispatching capabilities is to extend EventDispatcher. 
 * If this is impossible (that is, if the class is already extending another class), you can instead implement the IEventDispatcher interface, 
 * create an EventDispatcher member, and write simple hooks to route calls into the aggregated EventDispatcher. You may also opt to "mixin" the class
 * by defining the interface functions and using EventDispatcher.initialize() which dynamically attaches the functions to an Object.
 * </p>
 */
class com.dreamsocket.events.EventDispatcher implements IEventDispatcher
{			
	/** @private */
	private static var k_instance:EventDispatcher;
	
	/** @private */
	private var m_evtDispatchTarget:Object;
	/** @private */
	private var m_evtListeners:Object;
	
	
	public function EventDispatcher(p_tgt:Object)
	{
		this.m_evtDispatchTarget = p_tgt;
		this.m_evtListeners = {};
	}


	/**
	 * Mixes in the EventDispatcher functionality dynamically into an Object.
	 */
	public static function initialize(p_o:IEventDispatcher):Void
	{
		if (EventDispatcher.k_instance == null)
		{
			EventDispatcher.k_instance = new EventDispatcher();
		}
		
		var i:EventDispatcher = EventDispatcher.k_instance;
		
		p_o["m_evtDispatchTarget"] = p_o;
		p_o["m_evtListeners"] = {};
		p_o["bubbleEvent"] = i.bubbleEvent;
		p_o.dispatchEvent = i.dispatchEvent;
		p_o.addEventListener = i.addEventListener;
		p_o.removeEventListener = i.removeEventListener;
		p_o.hasEventListener = i.hasEventListener;
		
		_global.ASSetPropFlags(p_o, "m_evtListeners", 1);
		_global.ASSetPropFlags(p_o, "m_evtDispatchTarget", 1);	
		_global.ASSetPropFlags(p_o, "bubbleEvent", 1);
	}
	

	/**
	 * Registers an event listener object with an EventDispatcher object so that the listener receives notification of an event. 
	 * 
	 * <p>
	 * Since ActionScript 2 does not have automatic closure when assigning a function to handle an event, to achieve specific function handlers
	 * that are properly scoped, the second parameter should specify the context (Object) that the call should be carried out on.
	 * </p>
	 *  
	 * <p>
	 * After you successfully register an event listener, you cannot change its priority through additional calls to addEventListener(). 
	 * To change a listener's priority, you must first call removeEventListener(). 
	 * Then you can register the listener again with the new priority level.
	 * </p>
	 *  
	 * <p>
	 * When you no longer need an event listener, remove it by calling EventDispatcher.removeEventListener(). 
	 * Objects with registered event listeners are not automatically removed from memory because the garbage collector does not remove objects that still have references.
	 * </p>
	 *  
	 * <p>
	 * Copying an EventDispatcher instance does not copy the event listeners attached to it. 
	 * (If your newly created node needs an event listener, you must attach the listener after creating the node.)
	 * However, if you move an EventDispatcher instance, the event listeners attached to it move along with it.
	 * </p>
	 *  
	 * <p>
	 * If the event listener is being registered on a node while an event is also being processed on this node, 
	 * the event listener is not triggered.
 	 * </p>
 	 *  
 	 * <p>
     * If an event listener is removed from a node while an event is being processed on the node, 
     * it is still triggered by the current actions. 
     * After it is removed, the event listener is never invoked again (unless it is registered again for future processing). 
     * </p>
     * 
	 * @param p_type The type of event
     * 
     * @param p_o The listener function or object that processes the event. 
     *  Developers should add an Object which defines the context the scope of the function handler (3rd parameter).
     *  However, the function can be used in a legacy manner (similar to Adobe's AS2 components).
     *  If a function is used, the function call will be carried out in the scope of the Object dispatching the event. 
     *  If an Object is defined, but not function handler is defined (3rd parameter), the dispatcher will
     *  attempt to call a function matches the event type's name on the Object. 
     * 
     * @param p_funct A function handler that will process the event.
     * 
     * @param p_priority (default = 0) -The priority level of the event listener.
     *  The higher the number, the higher the priority. 
     *  All listeners with priority n are processed before listeners of priority n-1. 
     *  If two or more listeners share the same priority, they are processed in the order in which they were added. The default priority is 0.
	 */
	public function addEventListener(p_event:String, p_o:Object, p_funct:Function, p_priority:Number):Void
	{
		var handler:Object = 
		{
			priority : (isNaN(p_priority) ? 0 : p_priority),
			listener : p_o,
			funct: p_funct
		};
		
		if (this.m_evtListeners[p_event] == null) 
		{
			this.m_evtListeners[p_event] = [];
		} 
		else 
		{
			this.removeEventListener(p_event, p_o, p_funct);
		}
		
		this.m_evtListeners[p_event].push(handler);	
		this.m_evtListeners[p_event].sortOn("priority", Array.NUMERIC | Array.DESCENDING);
	}
	
	

	public function dispatchEvent(p_event:Event):Void
	{
		var list:Array = this.m_evtListeners[p_event.type].concat();

		if(this.m_evtDispatchTarget == null)
		{
			this.m_evtDispatchTarget = this; 
			_global.ASSetPropFlags(this, "m_evtDispatchTarget", 1);	
		}	
		if(p_event.target == null) 
		{
			p_event.target = p_event.currentTarget = this.m_evtDispatchTarget;
		}
		
		if (list != null)
		{
			var method:String = p_event.type;
			var i:Number = 0;
			var len:Number = list.length;
			var listener:Object;			
			var o:Object;
					
			while (i < len)
			{
				if(p_event.cancelled)
				{
					return;
				}
				o = list[i++];

				listener = o.listener;
				if (o.funct != null)
				{	// call handler of listener
					o.funct.call(listener, p_event);
				} 
				else if (typeof(listener) == "function")
				{
					Function(listener)(p_event);
				} 
				else 
				{
					listener[method](p_event);
				}
			}
		}
		
		if(p_event.bubbles)
		{
			this.bubbleEvent(p_event);
		}		
	}

	

	public function hasEventListener(p_event:String):Boolean
	{
		return this.m_evtListeners[p_event].length > 0;
	}


	/**
	 * Removes a listener from the EventDispatcher object. 
	 * <p>
	 * If there is no matching listener registered with the EventDispatcher object, a call to this method has no effect. 
	 * </p>
	 * 
	 * <p>
	 * The parameters used to remove a listener should match the ones that were used to add it.
	 * </p>
	 *  
	 * @param p_type The type of event. 
	 * @param p_listener The listener object or function to remove.
	 * @param p_funct The function that is serving as the listener
	 */
	public function removeEventListener(p_event:String, p_o:Object, p_funct:Function):Void
	{
		var list:Array = this.m_evtListeners[p_event];
		
		if (list != null)
		{
			var i:Number = list.length;
			while(i--)
			{
				if(list[i].listener == p_o && list[i].funct == p_funct)
				{
					list.splice(i, 1);
					break;
				}
			}
		} 
	}
	
	
	/**
	 * Provides bubbling functionality into MovieClip based event dispatchers.
	 */
	private function bubbleEvent(p_event:Event):Void
	{
		var o:Object = this.m_evtDispatchTarget._parent;
		
		while(o != null)
		{
			if(o.dispatchEvent != null)
			{
				var evt:Event = p_event.clone();
				evt.eventPhase = EventPhase.BUBBLING_PHASE;
				evt.currentTarget = o;
				o.dispatchEvent(evt);
				return;
			}
			o = o._parent;
		}
	}	
}

