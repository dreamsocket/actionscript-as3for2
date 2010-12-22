//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.

import com.dreamsocket.events.Event; 

/**
 * The FullScreenEvent class can be dispatched whenever the Stage enters or leaves full-screen display mode.
 */
class com.dreamsocket.events.FullScreenEvent extends Event
{
	/**
	 * Dispatched when a change in the application's full screen state has occurred.
	 */
	public static var FULL_SCREEN:String = "fullScreen";
	
	private var m_fullScreen:Boolean;
	
	
	public function FullScreenEvent(p_type:String, p_fullScreen:Boolean, p_bubbles:Boolean)
	{ 
		super(p_type, p_bubbles);
		
		this.m_fullScreen = p_fullScreen ? true : false;
	}
	
	/**
	 * Indicates whether the Stage object is in full-screen mode (true) or not (false).
	 */
	public function get fullScreen():Boolean
	{
		return this.m_fullScreen;
	}
	
	
	/**
	 * Creates a copy of a FullScreenEvent object and sets the value of each property to match that of the original.
	 */
	public function clone():FullScreenEvent
	{
		return new FullScreenEvent(this.type, this.fullScreen, this.bubbles);
	}
	
	
	/**
	 * Returns a string that contains all the properties of the FullScreenEvent object.
	 */
	public function toString():String
	{
		return this.formatToString("FullScreenEvent", "type", "fullScreen", "bubbles", "eventPhase");	
	}	
}
