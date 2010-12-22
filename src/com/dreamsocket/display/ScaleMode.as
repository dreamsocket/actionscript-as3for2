/**
* Dreamsocket, Inc.
* http://dreamsocket.com
* Copyright 2010 Dreamsocket, Inc.
*
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without
* restriction, including without limitation the rights to use,
* copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following
* conditions:
*
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
**/
 
import flash.geom.Rectangle;
 
class com.dreamsocket.display.ScaleMode
{
	private var m_mode:String;
	private var m_rect:Rectangle;
		
	/**
	 * Specifies that media should be scaled to the exact dimensions defined.
	 * 
	 * <p>
	 * This will take a 320 x 240 media element in a 200 x 200 bounds and size the video to 200 x 200
	 * </p>
	 */		
	public static var FILL:String = "fill";
		
		
	/**
	 * Specifies that the media does not scale
	 * 
	 * <p>
	 * If a media element is 320 x 240 in a 200 x 200 bounds area, the media element will remain 320 x 240. 
	 * The default playback views crop the overflow and align the media based on it's horizontal and vertical alignment rules.
	 * Therefore if the 320 x 240 example were horizontally aligned left and vertically aligned at the bottom, the bottom left corner of the media would be visible.
	 * Custom playback views could choose to allow overflow. 
	 * </p>
	 */				
	public static var NONE:String = "none";
		

	/**
	 * Specifies that aspect ratio should be maintained when scaling media.
	 * 
	 * <p>
	 * This will take a 320 x 240 media element in a 200 x 200 bounds and resize it to 200 x 150. 
	 * The aspect ratio is maintained, making the video appear smaller or larger without distorting it's appearance.
	 * </p>
	 */			
	public static var UNIFORM:String = "uniform";
		
	
	/**
	 * Specifies that aspect ratio should be maintained when scaling media down. If scaling media up the media does not scale
	 * 
	 * <p>
	 * This will take a 320 x 240 media element in a 200 x 200 bounds and resize it to 200 x 150. 
	 * The aspect ratio is maintained, making the video appear smaller without distorting it's appearance.
	 * </p>
	 */			
	public static var UNIFORM_DOWN:String = "uniformDown";	

		
	public function ScaleMode(p_mode:String)
	{
		this.m_mode = p_mode; 
		this.m_rect = new Rectangle();
	}
		
		
	public function get mode():String
	{
		return this.m_mode;	
	}
		
	
	public function set mode(p_value:String):Void
	{
		this.m_mode = p_value;
	}

		
	public function getScaledSize(p_availableWidth:Number, p_availableHeight:Number, p_intrinsicWidth:Number, p_intrinsicHeight:Number):Rectangle
	{
		var xscale:Number = p_availableWidth / p_intrinsicWidth;;
		var yscale:Number = p_availableHeight / p_intrinsicHeight;
		var scale:Number;
		switch(this.m_mode)
		{
			case ScaleMode.FILL:
				this.m_rect.width = Math.max(1, p_availableWidth);
				this.m_rect.height = Math.max(1, p_availableHeight);
				break;
			case ScaleMode.UNIFORM_DOWN:
				scale = Math.min(1, (xscale > yscale) ? yscale : xscale);
				
				this.m_rect.width = Math.max(1, p_intrinsicWidth * scale); 
				this.m_rect.height = Math.max(1, p_intrinsicHeight * scale);	
				break;					
			case ScaleMode.UNIFORM:
				scale = (xscale > yscale) ? yscale : xscale;
				
				this.m_rect.width = Math.max(1, p_intrinsicWidth * scale); 
				this.m_rect.height = Math.max(1, p_intrinsicHeight * scale);	
				break;
			case ScaleMode.NONE:
			default:
				this.m_rect.width = p_intrinsicWidth;
				this.m_rect.height = p_intrinsicHeight;	
				break;				
		}	
		return this.m_rect;			
	}

		
	public function toString():String
	{
		return this.m_mode;
	}
}
