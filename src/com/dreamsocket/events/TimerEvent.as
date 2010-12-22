//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.

import com.dreamsocket.events.Event;

/**
 * The TimerEvent class is dispatched whenever the Timer object reaches the interval specified by the Timer.delay property.
 * 
 * @see com.dreamsocket.utils.Timer 
 */
class com.dreamsocket.events.TimerEvent extends Event
{
	/**
	 * Defines the value of the type property of a timer event object.
	 */
	public static var TIMER:String = "timer";
	
	/**
	 * Defines the value of the type property of a timerComplete event object.
	 */
	public static var TIMER_COMPLETE:String = "timerComplete";
	
	public function TimerEvent(p_type:String, p_bubbles:Boolean)
	{
		super(p_type, p_bubbles);
	}
	
	/**
	 * Creates a copy of the TimerEvent object and sets each property's value to match that of the original.
	 */
	public function clone():TimerEvent
	{
		return new TimerEvent(this.type, this.bubbles);
	}
	
	/**
	 * Returns a string that contains all the properties of the TimerEvent object.
	 */
	public function toString():String
	{
		return this.formatToString("TimerEvent", "type", "bubbles", "eventPhase");	
	}		
}