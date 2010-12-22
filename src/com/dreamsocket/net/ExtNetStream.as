//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.

import com.dreamsocket.events.Event;
import com.dreamsocket.events.EventDispatcher;
import com.dreamsocket.events.IEventDispatcher;
import com.dreamsocket.events.NetStatusEvent;
import com.dreamsocket.media.SoundTransform;
import com.dreamsocket.net.ExtNetConnection;
import com.dreamsocket.utils.Delegate;

[Event(name="netStatus", type="com.dreamsocket.events.NetStatusEvent")]
/**
 * The ExtNetStream class is a subclass of the native NetStream class that adds the interface and event functionality of its ActionScript 3 counterpart.
 * 
 * @see http://livedocs.adobe.com/flex/3/langref/flash/net/NetStream.html
 */
class com.dreamsocket.net.ExtNetStream extends NetStream implements IEventDispatcher
{
	private var m_client:Object = null;
	private var m_bufferTime:Number = 0.1;
	private var m_snd:Sound;
	private var m_sndHost:MovieClip;
	private var m_sndTransform:SoundTransform;
	private var m_videoHost:Object;
	
	public function ExtNetStream(p_nc:ExtNetConnection)
	{
		super(p_nc);
		
		this.m_client = null;
		this.m_bufferTime = .1;
		EventDispatcher.initialize(this);
	}	
	
	//-----------------------------------------------------------------
	//	PUBLIC : Properties 
		
	public function set bufferTime(p_v:Number):Void
	{
	 	this.m_bufferTime = p_v;
		this.setBufferTime(p_v);
	}
	
	
	public function get bufferTime():Number
	{
		return this.m_bufferTime;
	}
	
	
	/**
	 * Specifies the object on which callback methods are invoked to handle media file data. 
	 * The default object is this, the NetStream object being created. 
	 * If you set the client property to another object, callback methods are invoked on that other object. 
	 * The NetStream.client  object can call the following functions and receive an associated data object: onCuePoint(), onImageData(), onMetaData(), onPlayStatus(), onTextData(), and onXMPData(). 
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
			if(!ExtNetStream.prototype.hasOwnProperty(prop) && !NetStream.prototype.hasOwnProperty(prop))
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
			if(typeof(this.m_client[prop]) == "function" && !ExtNetStream.prototype.hasOwnProperty(prop) && !NetStream.prototype.hasOwnProperty(prop))
			{
				this[prop] = Delegate.create(this.m_client, this.m_client[prop]);
			}
		}
		// rehide curr client props
		_global.ASSetPropFlags(this.m_client.__proto__, null, 1, 1);
	}
	
	
	public function get currentFPS():Number
	{
		return this.currentFps;
	}	
	
	
	/**
	 * Specifies the internal soundTransform object that is used to maintain the sound state.
	 */			
	public function get soundTransform():SoundTransform
	{
		if(this.m_sndTransform == null)
		{
			this.m_sndTransform = new SoundTransform();
		}
		return this.m_sndTransform;
	}


	public function set soundTransform(p_value:SoundTransform):Void
	{
		if(p_value instanceof SoundTransform)
		{
			this.m_sndTransform = p_value;
			this.m_sndTransform.updateSound(this.m_snd);
		}
	}
	
	
	//-----------------------------------------------------------------
	//	PUBLIC : Methods 
	
	/**
	 * Attaches a MovieClip that will serve as a Sound's target allowing a playback's audio to be controlled.
	 */	
	public function attachAudioHost(p_movieClip:MovieClip):Void
	{
		if(p_movieClip != this.m_sndHost)
		{
			this.m_sndHost.attachAudio(null);
			
			this.m_sndHost = p_movieClip;
			this.m_sndHost.attachAudio(this);
			this.m_snd = new Sound(this.m_sndHost);
			this.m_sndTransform.updateSound(this.m_snd);
		}
	}


	/**
	 * Attaches a Video object to use for displaying an incoming stream.
	 * 
	 * <p>
	 * The playback will attach the video to the stream when the stream is created.
	 * When loading a new media file, the playback does not clear the Video. This will result in the old Video image
	 * remaining until the new stream starts. Developers can account for this by clearing the video when a 
	 * MediaRequestEvent.MEDIA_REQUEST_OPENING or MediaRequestEvent.MEDIA_REQUEST_CLOSED event occurs. By not 
	 * making an assumption on what you are doing with the image, the class provides greater flexibility of how you can 
	 * implement video to video image transitions.
	 * </p>
	 */
	public function attachVideoHost(p_video:Object):Void
	{
		if(p_video != this.m_videoHost)
		{
			// detach video from previous host
			if(this.m_videoHost.attachNetStream != null)
			{
				this.m_videoHost.attachNetStream(null);
			}
			else if(this.m_videoHost.attachVideo != null)
			{
				this.m_videoHost.attachVideo(null);
			}
			
			this.m_videoHost = p_video;
			

			// attach video to new host
			if(p_video.attachNetStream != null)
			{
				this.m_videoHost.attachNetStream(this);
			}
			else if(p_video.attachVideo != null)
			{
				this.m_videoHost.attachVideo(this);
			}			
		}
	}

	
	public function pause():Void
	{
		super.pause(true);
	}
	
	
	public function resume():Void
	{
		super.pause(false);
	}
	
	
	public function togglePause():Void
	{
		super.pause();
	}

	
	
	//	 EventDispatcher methods 
	public function addEventListener(p_evt:String, p_o:Object, p_funct:Function, p_priority:Number):Void{}
	public function dispatchEvent(p_evt:Event):Void{}
	public function hasEventListener(p_evt:String):Boolean{return false;}
	public function removeEventListener(p_evt:String, p_o:Object, p_funct:Function):Void{}	
	
	
	//-----------------------------------------------------------------
	//	PRIVATE : Handlers 
		
	private function onStatus(p_info:Object):Void
	{
		this.dispatchEvent(new NetStatusEvent(NetStatusEvent.NET_STATUS, p_info));

		if(this.m_client.hasOwnProperty("onStatus"))
		{
			this.m_client.onStatus(p_info);
		}		
	}
}