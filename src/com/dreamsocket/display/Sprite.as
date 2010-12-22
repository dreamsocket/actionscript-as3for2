//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.


import com.dreamsocket.display.MovieClip;
import com.dreamsocket.display.DisplayObject; 
import com.dreamsocket.display.Graphics; 
import com.dreamsocket.events.FocusEvent;
import com.dreamsocket.events.KeyboardEvent;
import com.dreamsocket.media.SoundTransform;
import com.dreamsocket.utils.Delegate; 

[Event(name="focusIn", type="com.dreamsocket.events.FocusEvent")]
[Event(name="focusOut", type="com.dreamsocket.events.FocusEvent")]

[Event(name="keyDown", type="com.dreamsocket.events.KeyboardEvent")]
[Event(name="keyUp", type="com.dreamsocket.events.KeyboardEvent")]

/**
 * The Sprite class provides an ActionScript 3 Sprite API and event system and applies it to MovieClips in ActionScript 2.
 */
class com.dreamsocket.display.Sprite extends DisplayObject
{
	private var m_graphics:Graphics;
	private var m_snd:Sound;
	private var m_sndTransform:SoundTransform;
	
		
	public function Sprite()
	{
		super();	
	}

	
	public function get graphics():Graphics
	{
		if(this.m_graphics == null)
		{
			this.m_graphics = new Graphics(this);
		}
		return this.m_graphics;
	}


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
		
	public function contains(p_displayObject:Object):Boolean
	{
		while(p_displayObject = p_displayObject._parent)
		{
			if(p_displayObject == this) return true;
		}
		
		return false;
	}
	
	
	//-----------------------------------------------------------------
	//	PRIVATE : Methods 
	
	private function init():Void
	{
		super.init();
		
		this.m_snd = new Sound(this);			
	}
		
	
	//-----------------------------------------------------------------
	//	PRIVATE : Handlers 
			
	private function onKeyDown():Void
	{
		var evt:KeyboardEvent = new KeyboardEvent(KeyboardEvent.KEY_DOWN, Key.getAscii(),Key.getCode(), 
														Key.isDown(Key.CONTROL), Key.isDown(Key.ALT), Key.isDown(Key.SHIFT), true);
		this.dispatchEvent(evt);
	}
	
	
	private function onKeyUp():Void
	{
		var evt:KeyboardEvent = new KeyboardEvent(KeyboardEvent.KEY_UP, Key.getAscii(),Key.getCode(), 
														Key.isDown(Key.CONTROL), Key.isDown(Key.ALT), Key.isDown(Key.SHIFT), true);
		this.dispatchEvent(evt);
	}
	
	
	private function onKillFocus(p_new:Object):Void
	{
		this.dispatchEvent(new FocusEvent(FocusEvent.FOCUS_OUT, this, true));
	}


	private function onSetFocus(p_old:Object):Void
	{
		this.dispatchEvent(new FocusEvent(FocusEvent.FOCUS_IN, this, true));
	}		
}
