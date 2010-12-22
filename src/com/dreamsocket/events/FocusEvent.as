//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.


import com.dreamsocket.events.Event;

/**
 * The FocusEvent class is dispatched when the user changes the focus from one object in the display list to another. 
 */
class com.dreamsocket.events.FocusEvent extends Event{
	
	/**
	 * Dispatched when an object gains focus.
	 */
	public static var FOCUS_IN:String = "focusIn";
	
	/**
	 * Dispatched when an object that has focus goes out of focus.
	 */
	public static var FOCUS_OUT:String = "focusOut";
	
	
	private var m_relatedObject:Object;
	
	
	public function FocusEvent(p_type:String, p_relatedObject:Object, p_bubbles:Boolean)
	{
		super(p_type, p_bubbles);
		
		this.m_relatedObject = p_relatedObject;
	}

	
	public function get keyCode():Object
	{
		return Key.getCode();
	}	
	
	
	public function get relatedObject():Object
	{
		return this.m_relatedObject;
	}
	
	
	public function get shiftKey():Boolean
	{
		return Key.isDown(Key.SHIFT);
	}
	
	
	/**
	 * Creates a copy of the FocusEvent object and sets the value of each property to match that of the original.
	 */
	public function clone():FocusEvent
	{
		return new FocusEvent(this.m_type, this.relatedObject, this.m_bubbles);
	}
	
	/**
	 * Returns a string that contains all the properties of the FocusEvent object.
	 */
	public function toString():String
	{
		return this.formatToString("FocusEvent", "type", "relatedObject", "bubbles", "eventPhase");	
	}		
}