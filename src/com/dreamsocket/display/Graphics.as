//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.


/**
 * The Graphics class contains a set of methods that you can use to create a vector shape.
 */
class com.dreamsocket.display.Graphics
{
	private var m_mc:MovieClip;
	
	public function Graphics(p_mc:MovieClip)
	{
		this.m_mc = p_mc;
	}
	
	
	public function beginFill(p_rgb:Number, p_alpha:Number):Void
	{
		this.m_mc.beginFill(p_rgb, p_alpha);
	}
	
	
	public function beginGradientFill(p_fillType:String, p_colors:Array, p_alphas:Array, p_ratios:Array, p_matrix:Object, p_spreadMethod:String, p_interpolationMethod:String, p_focalPointRatio:Number):Void
	{
		this.m_mc.beginGradientFill(p_fillType, p_colors, p_alphas, p_ratios, p_matrix, p_spreadMethod, p_interpolationMethod, p_focalPointRatio);
	}


	public function clear():Void
	{
		this.m_mc.clear();	
	}
	
	
	public function curveTo(p_controlX:Number, p_controlY:Number, p_anchorX:Number, p_anchorY:Number):Void
	{
		this.m_mc.curveTo(p_controlX, p_controlY, p_anchorX, p_anchorY);
	}
	
	
	public function endFill():Void
	{
		this.m_mc.endFill();
	}
	
	
	public function drawRect(p_x:Number, p_y:Number, p_width:Number, p_height:Number):Void
	{
		this.m_mc.moveTo(p_x, p_y);
		this.m_mc.lineTo(p_x+p_width, p_y);
		this.m_mc.lineTo(p_x+p_width, p_y+p_height);
		this.m_mc.lineTo(p_x, p_y+p_height);
		this.m_mc.lineTo(p_x, p_y);		
	}
	
	
	public function lineGradientStyle(p_fillType:String, p_colors:Array, p_alphas:Array, p_ratios:Array, p_matrix:Object, p_spreadMethod:String, p_interpolationMethod:String, p_focalPointRatio:Number):Void
	{
		this.m_mc.lineGradientStyle(p_fillType, p_colors, p_alphas, p_ratios, p_matrix, p_spreadMethod, p_interpolationMethod, p_focalPointRatio);
	}	
	
	
	public function lineStyle(p_thickness:Number, p_rgb:Number, p_alpha:Number, p_pixelHinting:Boolean, p_noScale:String, p_capsStyle:String, p_jointStyle:String, p_miterLimit:Number):Void
	{
		this.m_mc.lineStyle(p_thickness, p_rgb, p_alpha, p_pixelHinting, p_noScale, p_capsStyle, p_jointStyle, p_miterLimit);
	}	
	
	
	public function lineTo(p_x:Number, p_y:Number):Void
	{
		this.m_mc.lineTo(p_x, p_y);
	}
	
	
	public function moveTo(p_x:Number, p_y:Number):Void
	{
		this.m_mc.moveTo(p_x, p_y);
	}
}
