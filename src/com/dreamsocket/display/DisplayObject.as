//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.


import com.dreamsocket.display.StageClass;
import com.dreamsocket.events.Event;
import com.dreamsocket.events.EventDispatcher;
import com.dreamsocket.events.IEventDispatcher;

/**
 * The DisplayObject class provides an ActionScript 3 DisplayObject API and applies it to MovieClips in ActionScript 2.
 */
class com.dreamsocket.display.DisplayObject extends MovieClip implements IEventDispatcher
{
	private static var k_stage:StageClass;
	private var m_initialized:Boolean;
	
	public function DisplayObject()
	{
		super();
		
		this.init();		
	}
	
	
	//-----------------------------------------------------------------
	//	PUBLIC : Properties 
		
	public function set alpha(p_value:Number):Void
	{
		this._alpha = p_value;
	}
	
	
	public function get alpha():Number
	{
		return this._alpha;
	}	
	
	
	public function set x(p_value:Number):Void
	{
		this._x = p_value;
	}
	
	
	public function get x():Number
	{
		return this._x;
	}	
	
	
	public function set y(p_value:Number):Void
	{
		this._y = p_value;
	}
	
	
	public function get y():Number
	{
		return this._y;
	}	
	
		
	public function set height(p_value:Number):Void
	{
		this._height = p_value;
	}
	
	
	public function get height():Number
	{
		return this._height;
	}	
	
	
	public function set mask(p_value:MovieClip):Void
	{
		this.setMask(p_value);
	}	
	
	
	public function get mouseX():Number
	{
		return this._xmouse;
	}
	
	
	public function get mouseY():Number
	{
		return this._ymouse;
	}
	
	
	public function get name():String
	{
		return this._name;
	}
	
	
	public function set name(p_value:String):Void
	{
		this._name = p_value;
	}	
	
	
	public function get parent():MovieClip
	{
		return this._parent;
	}	
	
	
	public function get root():MovieClip
	{
		return _root;
	}	
	
	
	public function get rotation():Number
	{
		return this._rotation;
	}
	
	
	public function set rotation(p_value:Number):Void
	{
		this._rotation = p_value;
	}	
	
			
	public function get scaleX():Number
	{
		return this._xscale / 100;
	}
	
	
	public function set scaleX(p_value:Number):Void
	{
		this._xscale = p_value * 100;
	}	
	
	
	public function get stage():StageClass
	{
		if(k_stage == null) k_stage = new StageClass();
		
		return k_stage;
	}
	
	
	public function set scaleY(p_value:Number):Void
	{
		this._yscale = p_value * 100;
	}
	
	
	public function get scaleY():Number
	{
		return this._yscale / 100;
	}
	
			
	public function set width(p_value:Number):Void
	{
		this._width = p_value;
	}	
	
	
	public function get width():Number
	{
		return this._width;
	}
	
	
	public function get visible():Boolean
	{
		return this._visible;
	}
	
	
	public function set visible(p_value:Boolean):Void
	{
		this._visible = p_value;
	}
	
		
	//-----------------------------------------------------------------
	//	PUBLIC : Methods 

	public function createInstance(p_parent:MovieClip, p_name:String, p_depth:Number):DisplayObject
	{
		var name:String = p_name == null ? "symbol" + (new Date().valueOf() +  Math.floor(Math.random() * 1000)) : p_name;
		var depth:Number = isNaN(p_depth) ? p_parent.getNextHighestDepth() : p_depth;
		var mc:MovieClip = (p_parent.createEmptyMovieClip(name, depth));
		
		// dynamically register instance
		mc.__proto__ = this.__proto__;
		mc.__constructor__ = this["__constructor__"];
		mc.init();

		return DisplayObject(mc);
	}
	
	//	mixin EventDispatcher methods 
	public function addEventListener(p_evt:String, p_o:Object, p_funct:Function, p_priority:Number):Void{}
	public function dispatchEvent(p_evt:Event):Void{}
	public function hasEventListener(p_evt:String):Boolean{return false;}
	public function removeEventListener(p_evt:String, p_o:Object, p_funct:Function):Void{}	
	
	
	//-----------------------------------------------------------------
	//	PRIVATE : Methods 
	
	private function init():Void
	{
		if(this.m_initialized) return;
		
		this.m_initialized = true;
		this._focusrect = false;


		EventDispatcher.initialize(this);		
	}
}