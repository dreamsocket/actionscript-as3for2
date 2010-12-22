//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.


import com.dreamsocket.events.EventPhase;

/**
 * The Event class is used as the base class for the creation of Event objects, which are passed as parameters to event listeners when an event occurs.
 * 
 * The class is meant to emulate the ActionScript 3 Event class and provide the same type of functionality in ActionScript 2.
 * 
 * The properties of the Event class carry basic information about an event. 
 * For many events, such as the events represented by the Event class constants, this basic information is sufficient. 
 * Other events, however, may require more detailed information. 
 * Events associated with a mouse click, for example, need to include additional information about the location of the click event. 
 * You can pass such additional information to event listeners by extending the Event class, which is what the MouseEvent class does. 
 * 
 * The methods of the Event class can be used in event listener functions to affect the behavior of the event object. 
 * You can make the current event listener the last one to process an event by calling the stopPropogation() or stopImmediatePropogation() method. 
 */
class com.dreamsocket.events.Event 
{
	/**
	 * Dispatched when something has changed.
	 */	
	public static var CHANGE:String = "change";
	
	/**
	 * Dispatched when something is closing.
	 */
	public static var CLOSE:String = "close";
	
	
	/**
	 * Dispatched when something has completed.
	 */	
	public static var COMPLETE:String = "complete";
	
	
	/**
	 * Dispatched when something is connected.
	 */	
	public static var CONNECT:String = "connect";
	
	
	/**
	 * Dispatched when something has initialized.
	 */	
	public static var INIT:String = "init";
	

	/**
	 * Dispatched when something is opening.
	 */	
	public static var OPEN:String = "open";


	/**
	 * Dispatched when something has resize.
	 */	
	public static var RESIZE:String = "resize";	
	
	
	/**
	 * Dispatched when something has selected.
	 */	
	public static var SELECT:String = "select";	
	
		
	/** @private */
	private var m_type:String;
	/** @private */
	private var m_bubbles:Boolean;
	/** @private */
	private var m_cancelled:Boolean;
	
	
	public function Event(p_type:String, p_bubbles:Boolean)
	{	
		this.m_type = p_type;
		this.m_bubbles = p_bubbles == null ? false : p_bubbles;
		this.m_cancelled = false;
		this.eventPhase = EventPhase.AT_TARGET;
	}
	
	/**
	 * Indicates whether an event is a bubbling event. If the event can bubble, this value is true; otherwise it is false. 
	 * Bubbling can only occur for DisplayObject based events, which flows from the target node up the display list hierarchy.
	 */
	public function get bubbles():Boolean
	{
		return this.m_bubbles;
	}
	
	/**
	 * Indicates whether the behavior associated with the event can be prevented. 
	 * If the behavior can be canceled, this value is true; otherwise it is false
	 */
	public function get cancelled():Boolean
	{
		return this.m_cancelled;
	}
	
	/**
	 * The object that is actively processing the Event object with an event listener. 
	 * For example, if a user clicks an OK button, the current target could be the node containing that button or one of its ancestors that has registered an event listener for that event.
	 */
	public var currentTarget:Object;
		
	
	/**
	 * The current phase in the event flow. This property can contain the following numeric values:
	 * <ul>
     * <li>The target phase (EventPhase.AT_TARGET).</li>
     * <li>The bubbling phase (EventPhase.BUBBLING_PHASE).</li>
     * </ul>
     * 
     * @see com.dreamsocket.events.EventPhase
	 */
	public var eventPhase:Number;
		
	
	/**
	 * The event target. This property contains the target node. 
	 * For example, if a user clicks an OK button, the target node is the display list node containing that button.
	 */
	public var target:Object;
	
		
	/**
	 * The type of event. The type is case-sensitive. 
	 */
	public function get type():String
	{
		return this.m_type;
	}
	
	/**
	 *  Duplicates an instance of an Event subclass.
	 *  
	 *  <p>
	 *  Returns a new Event object that is a copy of the original instance of the Event object. 
	 *  You do not normally call clone(); the EventDispatcher class calls it automatically when it bubbles an event.
	 *  </p>
	 *  
	 *  <p>
	 *  The new Event object includes all the properties of the original.
	 *  </p>
	 *  
	 *  <p>
	 *  When creating your own custom Event class, you must override the inherited Event.clone() method in order for it to duplicate 
	 *  the properties of your custom class. If you do not set all the properties that you add in your event subclass, those properties will
	 *  not have the correct values when and event is bubbled.
	 *  </p>
	 *  
	 */
	public function clone():Event
	{
		return new Event(this.type, this.bubbles);
	}
	
	
	/**
	 * A utility function for implementing the toString() method in custom Event classes. 
	 * Overriding the toString() method is recommended, but not required.
	 * 
	 * <pre>
	 *   class PingEvent extends Event 
	 *   {
	 *	   var URL:String;
	 *	  
	 *	   public override function toString():String 
	 *	   { 
	 *	   	return formatToString("PingEvent", "type", "bubbles", "cancelable", "eventPhase", "URL"); 
	 *	   }
	 *	 }
	 * </pre>
	 */
	public function formatToString(p_eventType:String):String
	{
		var s:String = "[";
		var args:Array;
		var prop:String;
		var i:Number = 0;
		var len:Number;
		
		s += String(arguments.shift());
		
		args = arguments;
		len = args.length;
		while(i < len)
		{
			prop = args[i++];
			s += " " + prop + "=" + this[prop];
		}
		
		s += "]";
		
		return s;
	}

	
	/**
	 * Prevents processing of any event listeners in the current node and any subsequent nodes in the event flow. 
	 * This method takes effect immediately, and it affects event listeners in the current node. 
	 * In contrast, the stopPropagation() method doesn't take effect until all the event listeners in the current node finish processing.
	 */
	public function stopImmediatePropagation():Void
	{
		this.m_cancelled = true;
		this.m_bubbles = false;
	}
		
	
	/**
	 * Prevents processing of any event listeners in nodes subsequent to the current node in the event flow. 
	 * This method does not affect any event listeners in the current node (currentTarget). 
	 * In contrast, the stopImmediatePropagation() method prevents processing of event listeners in both the current node and subsequent nodes. 
	 * Additional calls to this method have no effect. 
	 * This method can be called in any phase of the event flow.
	 */
	public function stopPropagation():Void
	{
		this.m_bubbles = false;
	}
	
	
	/**
	 * Returns a string containing all the properties of the Event object. The string is in the following format:<br/>
	 * <code>[Event type=value bubbles=value cancelable=value]</code>
	 */
	public function toString():String
	{
		return this.formatToString("Event", "type", "bubbles", "eventPhase");
	}
}