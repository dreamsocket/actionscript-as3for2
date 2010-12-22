//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.


import com.dreamsocket.events.Event;

/**
 * The NetStatusEvent class is dispatched when a NetConnection, NetStream, or SharedObject object reports its status. 
 */
class com.dreamsocket.events.NetStatusEvent extends Event
{
	/**
	 * Defines the value of the type property of a netStatus event object.
	 */
	public static var NET_STATUS:String = "netStatus";
	
	private var m_info:Object;


	public function NetStatusEvent(p_type:String, p_info:Object, p_bubbles:Boolean)
	{
		super(p_type, p_bubbles);
		this.m_info = p_info;	
	}

	
	/**
	 * An object with properties that describe the object's status or error condition.
	 */
	public function get info():Object
	{
		return this.m_info;
	}
	
	
	/**
	 * Creates a copy of the NetStatusEvent object and sets the value of each property to match that of the original.
	 */
	public function clone():NetStatusEvent
	{
		return new NetStatusEvent(this.m_type, this.m_info, this.m_bubbles);
	}
	
	/**
	 * Returns a string that contains all the properties of the NetStatusEvent object.
	 */
	public function toString():String
	{
		return this.formatToString("NetStatusEvent", "type", "bubbles", "eventPhase");	
	}		
}