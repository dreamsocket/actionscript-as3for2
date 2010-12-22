//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.

/**
 * The Rectangle class creates a base implementation of the native Flash Rectangle class for versions of ActionScript prior to 8.
 */
class com.dreamsocket.geom.Rectangle
{
	private var m_x:Number;
	private var m_y:Number;
	private var m_width:Number;
	private var m_height:Number;
	
    public function Rectangle(p_x:Number, p_y:Number, p_width:Number, p_height:Number)
    {
		this.m_x = isNaN(p_x) ? 0 : p_x;
		this.m_y = isNaN(p_y) ? 0 : p_y;
		this.m_width = isNaN(p_width) ? 0 : p_width;
		this.m_height = isNaN(p_height) ? 0 : p_height;
    }
   
   	/**
   	 * The sum of the y and height properties.
   	 */
    public function get bottom():Number
    {
        return this.m_y + this.m_height;
    }   

    public function set bottom(p_value:Number):Void
    {
		this.m_height = p_value - this.top;
    }
   
   	/**
   	 * The height of the rectangle, in pixels.
   	 */
    public function get height():Number
    {
        return this.m_height;
    }

    public function set height(p_value:Number):Void
    {
		this.m_height = p_value;
    }

	/**
	 * The x coordinate of the top-left corner of the rectangle.
	 */
    public function get left():Number
    {
        return this.m_x;
    }

    public function set left(p_value:Number):Void
    {
		this.m_width = this.right - p_value; 
		this.m_x = p_value;
    }
	
	/**
	 * The sum of the x and width properties.
	 */
    public function get right():Number
    {
        return this.m_x + this.width;
    }

    public function set right(p_value:Number):Void
    {
		this.m_width = p_value - this.left;
    }
  
  
  	/**
  	 * The y coordinate of the top-left corner of the rectangle.
  	 */
    public function get top():Number
    {
        return this.m_y;
    }

    public function set top(p_value:Number):Void
    {
		this.m_height = this.bottom - p_value; 
		this.m_y = p_value;
    }
   
    public function get width():Number
    {
        return this.m_width;
    }             
   
   	/**
   	 * The width of the rectangle, in pixels.
   	 */
    public function set width(p_value:Number):Void
    {
		this.m_width = p_value;
    }             
   
   
    /**
     * The x coordinate of the top-left corner of the rectangle.
     */    
    public function get x():Number
    {
        return this.m_x;
    }
        
            
    public function set x(p_value:Number):Void
    {
		this.m_x = p_value;
    }

	/**
	 * The y coordinate of the top-left corner of the rectangle.
	 */
    public function get y():Number
    {
        return this.m_y;
    }

    public function set y(p_value:Number):Void
    {
		this.m_y = p_value;
    }

	/**
	 * Returns a new Rectangle object with the same values for the x, y, width, and height properties as the original Rectangle object.
	 */
    public function clone():Rectangle
    {
        var rect:Rectangle = new Rectangle(this.m_x, this.m_y, this.m_width, this.m_height);
        
        
        return rect;       
    }

	/**
	 * Builds and returns a string that lists the horizontal and vertical positions and the width and height of the Rectangle object.
	 */
    public function toString():String
    {
        return "[Rectangle](x=" + this.m_x + ", y=" + this.m_y + ", w=" + this.m_width + ", h=" + this.m_height + ")";
    }
}