//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.


import com.dreamsocket.events.Event;

/**
 * The KeyboardEvent class is dispatched in response to user input through a keyboard. 
 * 
 * This event is generated for FlashUIComponents that have focus.
 */
class com.dreamsocket.events.KeyboardEvent extends Event
{
	/**
	 * Dispatched when a key is pressed down.
	 */
	public static var KEY_DOWN:String = "keyDown";
	
	
	/**
	 * Dispatched when a key is released.
	 */
	public static var KEY_UP:String = "keyUp";
	
	private var m_altKey:Boolean;
	private var m_charCode:Number;
	private var m_ctrlKey:Boolean;
	private var m_keyCode:Number;
	private var m_shiftKey:Boolean;
	
	
	public function KeyboardEvent(p_type:String, p_charCode:Number, p_keyCode:Number, p_ctrlKey:Boolean, p_altKey:Boolean, p_shiftKey:Boolean, p_bubbles:Boolean)
	{
		super(p_type, p_bubbles);
		
		this.m_charCode = p_charCode;
		this.m_keyCode = p_keyCode;
		this.m_ctrlKey = p_ctrlKey;
		this.m_altKey = p_altKey;
		this.m_shiftKey = p_shiftKey;
		
	}
	
	/**
	 * Indicates whether the Alt key is active (true) or inactive (false) on Windows; indicates whether the Option key is active on Mac OS.
	 */
	public function get altKey():Boolean
	{
		return this.m_altKey;
	}
	
	/**
	 * Contains the character code value of the key pressed or released.
	 */
	public function get charCode():Number
	{
		return this.m_charCode;
	}
	
	/**
	 * On Windows and Linux, indicates whether the Ctrl key is active (true) or inactive (false); On Mac OS, indicates whether either the Ctrl key or the Command key is active.
	 */
	public function get ctrlKey():Boolean
	{
		return this.m_ctrlKey;
	}
	
	
	/**
	 * The key code value of the key pressed or released.
	 */
	public function get keyCode():Number
	{
		return this.m_keyCode;
	}
	
	
	/**
	 * Indicates whether the Shift key modifier is active (true) or inactive (false).
	 */
	public function get shiftKey():Boolean
	{
		return this.m_shiftKey;
	}	
	
	
	/**
	 * Indicates that the display should be rendered after processing of this event completes, if the display list has been modified.
	 */
	public function updateEvent():Void
	{
		updateEvent();
	}		
	
	
	/**
	 * Creates a copy of the KeyboardEvent object and sets the value of each property to match that of the original.
	 */
	public function clone():Event
	{
		return new KeyboardEvent(this.m_type, this.m_charCode, this.m_keyCode, this.m_ctrlKey, this.m_altKey, this.m_shiftKey, this.m_bubbles);
	}	
	
	
	/**
	 * Returns a string that contains all the properties of the KeyboardEvent object.
	 */
	public function toString():String
	{
		return this.formatToString("KeyboardEvent", "type", "charCode", "keyCode", "ctrlKey", "altKey", "shiftKey", "bubbles", "eventPhase");	
	}		
}