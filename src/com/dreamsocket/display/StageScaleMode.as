//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.

/**
 * A set of constants for stage scale modes.
 */
class com.dreamsocket.display.StageScaleMode 
{
	/**
	 * Specifies that the entire application be visible in the specified area without trying to preserve the original aspect ratio.
	 */
	public static var EXACT_FIT:String = "exactFit";
	
	/**
	 * Specifies that the entire application fill the specified area, without distortion but possibly with some cropping, while maintaining the original aspect ratio of the application.
	 */
	public static var NO_BORDER:String = "noBorder";
	
	/**
	 * Specifies that the size of the application be fixed, so that it remains unchanged even as the size of the player window changes.
	 */
	public static var NO_SCALE:String = "noScale";
	
	/**
	 * Specifies that the entire application be visible in the specified area without distortion while maintaining the original aspect ratio of the application.
	 */
	public static var SHOW_ALL:String = "showAll";
		
	private function StageScaleMode()
	{
	}
}