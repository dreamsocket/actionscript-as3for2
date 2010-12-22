//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.


import com.dreamsocket.events.Event;

/**
 * The ErrorEvent class is dispatched when an error causes an asynchronous operation to fail. 
 */
class com.dreamsocket.events.ErrorEvent extends Event
{
	/**
	 * Dispatched when an error occurs asynchrnously.
	 */
	public static var ERROR:String = "error";
	
	/** @private */
	private var m_msg:String;


	public function ErrorEvent(p_type:String, p_msg:String, p_bubbles:Boolean)
	{
		super(p_type, p_bubbles);
		this.m_msg = p_msg;	
	}


	/**
	 * Human readable description of the error.
	 */
	public function get text():String
	{
		return this.m_msg;
	}
	
	
	/**
	 * Creates a copy of the ErrorEvent object and sets the value of each property to match that of the original.
	 */
	public function clone():Event
	{
		return new ErrorEvent(this.m_type, this.m_msg, this.m_bubbles);
	}
	
	/**
	 * Returns a string that contains all the properties of the ErrorEvent object.
	 */
	public function toString():String
	{
		return this.formatToString("ErrorEvent", "type", "text", "bubbles", "eventPhase");	
	}		
}