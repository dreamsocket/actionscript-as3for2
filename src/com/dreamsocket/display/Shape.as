//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.

 
import com.dreamsocket.display.DisplayObject;
import com.dreamsocket.display.Graphics; 

/**
 * The Shape class provides an ActionScript 3 Shape API and applies it to MovieClips in ActionScript 2.
 */
class com.dreamsocket.display.Shape extends DisplayObject
{
	private var m_graphics:Graphics;
	
		
	public function get graphics():Graphics
	{
		if(this.m_graphics == null)
		{
			this.m_graphics = new Graphics(this);
		}
		return this.m_graphics;
	}	
}
