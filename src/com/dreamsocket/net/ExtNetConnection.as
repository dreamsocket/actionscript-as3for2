//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.

import com.dreamsocket.events.Event;
import com.dreamsocket.events.EventDispatcher;
import com.dreamsocket.events.IEventDispatcher;
import com.dreamsocket.events.NetStatusEvent;
import com.dreamsocket.utils.Delegate;

[Event(name="netStatus", type="com.dreamsocket.events.NetStatusEvent")]
/**
 * The ExtNetConnection class is a subclass of the native NetConnection class that adds the interface and event functionality of its ActionScript 3 counterpart.
 * 
 * @see http://livedocs.adobe.com/flex/3/langref/flash/net/NetConnection.html
 */
class com.dreamsocket.net.ExtNetConnection extends NetConnection implements IEventDispatcher
{
	private var m_client:Object;
		
	public function ExtNetConnection()
	{
		super();
		this.m_client = null;
		EventDispatcher.initialize(this);
	}	
	
	
	/**
	 * dicates the object on which callback methods should be invoked. The default is this NetConnection instance. 
	 * If you set the client property to another object, callback methods will be invoked on that object. 
	 */
	public function get client():Object
	{
		return this.m_client;
	}
	
	
	public function set client(p_c:Object):Void
	{	
		var prop;

		// unhide all props
 		_global.ASSetPropFlags(this.m_client.__proto__, null, 0, 1);
		_global.ASSetPropFlags(this.m_client.__proto__, ["__constructor__", "__proto__"], 1, 1);	
		// remove all client handlers
		for(prop in this.m_client)
		{
			if(typeof(this.m_client[prop]) == "function" && !ExtNetConnection.prototype.hasOwnProperty(prop) && !NetConnection.prototype.hasOwnProperty(prop))
			{
				delete(this[prop]);
			}
		}
		// rehide prev client props
		_global.ASSetPropFlags(this.m_client.__proto__, null, 1, 1);		
		
		// set client
		this.m_client = p_c;
		// unhide all props
		_global.ASSetPropFlags(this.m_client.__proto__, null, 0, 1);
		_global.ASSetPropFlags(this.m_client.__proto__, ["__constructor__", "__proto__"], 1, 1);		
		// attach all client handlers
		for(prop in this.m_client)
		{
			if(typeof(this.m_client[prop]) == "function" && !ExtNetConnection.prototype.hasOwnProperty(prop) && !NetConnection.prototype.hasOwnProperty(prop))
			{
				this[prop] = Delegate.create(this.m_client, this.m_client[prop]);
			}
		}
		// rehide curr client props
		_global.ASSetPropFlags(this.m_client.__proto__, null, 1, 1);	
	}
	
	/**
	 * Indicates whether the application is connected to a server through a persistent RTMP connection (true) or not (false). 
	 * When connected through HTTP, this property is false.
	 */
	public function get connected():Boolean
	{
		return this.isConnected;
	}
	
	
	//	 EventDispatcher methods 
	public function addEventListener(p_evt:String, p_o:Object, p_funct:Function, p_priority:Number):Void{}
	public function dispatchEvent(p_evt:Event):Void{}
	public function hasEventListener(p_evt:String):Boolean{return false;}
	public function removeEventListener(p_evt:String, p_o:Object, p_funct:Function):Void{}	
	
	//-----------------------------------------------------------------
	//	PRIVATE: HANDLERS		
	
	private function onStatus(p_info:Object):Void
	{
		this.dispatchEvent(new NetStatusEvent(NetStatusEvent.NET_STATUS, p_info));
		if(this.m_client.onStatus != null)
		{
			this.m_client.onStatus(p_info);
		}
	}
}