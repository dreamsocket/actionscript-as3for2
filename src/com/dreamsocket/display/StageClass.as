/**
 * Dreamsocket
 * 
 * Copyright 2010 Dreamsocket.
 * All Rights Reserved. 
 *
 * This software (the "Software") is the property of Dreamsocket and is protected by U.S. and
 * international intellectual property laws. No license is granted with respect to the
 * software and users may not, among other things, reproduce, prepare derivative works
 * of, modify, distribute, sublicense, reverse engineer, disassemble, remove, decompile,
 * or make any modifications of the Software without written permission from Dreamsocket.
 * Further, Dreamsocket does not authorize any user to remove or alter any trademark, logo,
 * copyright or other proprietary notice, legend, symbol, or label in the Software.
 * This notice is not intended to, and shall not, limit any rights Dreamsocket has under
 * applicable law.
 * 
 */


import flash.geom.Rectangle;

import com.dreamsocket.display.StageDisplayState; 
import com.dreamsocket.events.Event;
import com.dreamsocket.events.EventDispatcher;
import com.dreamsocket.events.FullScreenEvent;
import com.dreamsocket.events.KeyboardEvent;
 
 
class com.dreamsocket.display.StageClass extends EventDispatcher
{
	private var m_focus:Object;
	
	public function StageClass()
	{
		super();
		
		Key.addListener(this);
		Stage.addListener(this);
	}
	
	
	public function get align():String
	{
		return Stage.align;
	}	
	
	
	public function set align(p_value:String):Void
	{
		Stage.align = p_value;
	}	
	
	
	public function get displayState():String
	{
		return Stage["displayState"] == null ? StageDisplayState.NORMAL : Stage["displayState"];
	}	
	
	
	public function set displayState(p_value:String):Void
	{
		Stage["displayState"] = p_value;
	}	

		
	public function get focus():Object
	{
		return this.m_focus;
	}
	
	
	public function set focus(p_value:Object):Void
	{
		if(this.focus != p_value)
		{
			this.m_focus = p_value;
			Selection.setFocus(null);
			Selection.setFocus(p_value);
		}
	}

	
	public function get fullScreenHeight():Number
	{
		return System.capabilities.screenResolutionY;
	}
	
	
	public function get fullScreenWidth():Number
	{
		return System.capabilities.screenResolutionX;
	}
	
	
	public function get fullScreenSourceRect():Rectangle
	{
		return Stage["fullScreenSourceRect"];
	}

	
	public function set fullScreenSourceRect(p_value:Rectangle):Void
	{
		Stage["fullScreenSourceRect"] = p_value;
	}
	
	
	public function get height():Number
	{
		return _root._height;
	}	
	
	
	public function get scaleMode():String
	{
		return Stage.scaleMode;
	}	
	
	
	public function set scaleMode(p_value:String):Void
	{
		Stage.scaleMode = p_value;
	}	
	

	public function get showDefaultContextMenu():Boolean
	{
		return Stage.showMenu;
	}	
	
	
	public function set showDefaultContextMenu(p_value:Boolean):Void
	{
		Stage.showMenu = p_value;
	}


	public function get stageFocusRect():Boolean
	{
		return _focusRect;
	}	
	
	
	public function set stageFocusRect(p_value:Boolean):Void
	{
		_focusRect = p_value;
	}
	
		
	public function get quality():Object
	{
		return _quality;
	}	
	
	
	public function set quality(p_value:String):Void
	{
		_quality = p_value;
	}
	
	
	public function get stageHeight():Number
	{
		return Stage.height;
	}	
	
		
	public function get stageWidth():Number
	{
		return Stage.width;
	}	
	
	
	public function get width():Number
	{
		return _root._width;
	}

	
	private function onFullScreen(p_fullScreen:Boolean):Void
	{	
		this.dispatchEvent(new FullScreenEvent(FullScreenEvent.FULL_SCREEN, p_fullScreen));
	}
	

	private function onKeyDown():Void
	{
		if(!this.hasEventListener(KeyboardEvent.KEY_DOWN)) return;
		
		var evt:KeyboardEvent = new KeyboardEvent(KeyboardEvent.KEY_DOWN, Key.getAscii(),Key.getCode(), 
														Key.isDown(Key.CONTROL), Key.isDown(Key.ALT), Key.isDown(Key.SHIFT), true);
		this.dispatchEvent(evt);
	}
	
	
	private function onKeyUp():Void
	{
		if(!this.hasEventListener(KeyboardEvent.KEY_UP)) return;
		
		var evt:KeyboardEvent = new KeyboardEvent(KeyboardEvent.KEY_UP, Key.getAscii(),Key.getCode(), 
														Key.isDown(Key.CONTROL), Key.isDown(Key.ALT), Key.isDown(Key.SHIFT), true);
		this.dispatchEvent(evt);		
	}
	
		
	private function onResize():Void
	{	
		if(this.hasEventListener(Event.RESIZE))
			this.dispatchEvent(new Event(Event.RESIZE));
	}	
}
