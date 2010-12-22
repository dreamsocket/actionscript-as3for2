//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.

/**
 * A set of constants for stage quality values.
 */
class com.dreamsocket.display.StageQuality 
{
	/**
	 * Specifies very high rendering quality: graphics are anti-aliased using a 4 x 4 pixel grid and bitmaps are always smoothed.
	 */
	public static var BEST:String = "best";
	
	/**
	 * Specifies high rendering quality: graphics are anti-aliased using a 4 x 4 pixel grid, and bitmaps are smoothed if the movie is static.
	 */
	public static var HIGH:String = "high";
	
	/**
	 * Specifies low rendering quality: graphics are not anti-aliased, and bitmaps are not smoothed.
	 */
	public static var LOW:String = "low";
	
	/**
	 * Specifies medium rendering quality: graphics are anti-aliased using a 2 x 2 pixel grid, but bitmaps are not smoothed.
	 */
	public static var MEDIUM:String = "medium";
		
	private function StageQuality()
	{
	}
}