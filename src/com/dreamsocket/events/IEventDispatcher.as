//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.


import com.dreamsocket.events.Event;

/**
 * The IEventDispatcher interface defines methods for adding or removing event listeners, 
 * checks whether specific types of event listeners are registered, and dispatches events.
 * 
 * <p>
 * IEventDispatcher is meant to serve as an ActionScript 2 version of the native ActionScript 3 interface.
 * </p>
 * 
 * <p>
 * In general, the easiest way for a user-defined class to gain event dispatching capabilities is to extend EventDispatcher. 
 * If this is impossible (that is, if the class is already extending another class), you can instead implement the IEventDispatcher interface, 
 * create an EventDispatcher member, and write simple hooks to route calls into the aggregated EventDispatcher. You may also opt to "mixin" the class
 * by defining the interface functions and using EventDispatcher.initialize() which dynamically attaches the functions to an Object.
 * </p>
 */
interface com.dreamsocket.events.IEventDispatcher
{
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
	public function addEventListener(p_evt:String, p_o:Object, p_funct:Function, p_priority:Number):Void;
	
	
	/**
	 * Dispatches an event into the event flow.
	 */
	public function dispatchEvent(p_evt:Event):Void;
	
	
	/**
	 * Checks whether the EventDispatcher object has any listeners registered for a specific type of event. 
	 * This allows you to determine where an EventDispatcher object has altered handling of an event type in the event flow hierarchy. 
	 * To determine whether a specific event type will actually trigger an event listener, use IEventDispatcher.willTrigger(). 
	 */	
	public function hasEventListener(p_evt:String):Boolean;
	
	
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
	 * @see #addEventListener
	 * 
	 * @param p_type The type of event. 
	 * @param p_listener The listener object or function to remove.
	 * @param p_funct The function that is serving as the listener
	 */	
	public function removeEventListener(p_evt:String, p_o:Object, p_funct:Function):Void;
}