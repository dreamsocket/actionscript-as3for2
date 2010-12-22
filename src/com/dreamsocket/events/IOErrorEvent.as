//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.

import com.dreamsocket.events.ErrorEvent;

/**
 * The IOErrorEvent class is dispatched when an error causes a send or load operation to fail. 
 */
class com.dreamsocket.events.IOErrorEvent extends ErrorEvent
{
	/**
	 * Defines the value of the type property of an ioError event object.
	 */
	public static var IO_ERROR:String = "ioError";
	
	
	public function IOErrorEvent(p_type:String, p_msg:String, p_bubbles:Boolean)
	{
		super(p_type, p_msg, p_bubbles);
	}

	/**
	 * Creates a copy of the IOErrorEvent object and sets the value of each property to match that of the original.
	 */
	public function clone():IOErrorEvent
	{
		return new IOErrorEvent(this.m_type, this.m_msg, this.m_bubbles);
	}
	
	
	/**
	 * Returns a string that contains all the properties of the IOErrorEvent object.
	 */
	public function toString():String
	{
		return this.formatToString("IOErrorEvent", "type", "bubbles", "eventPhase");	
	}		
}