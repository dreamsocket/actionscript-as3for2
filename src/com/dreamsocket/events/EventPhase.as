//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.


/**
 * The EventPhase class provides values for the eventPhase property of the Event class. 
 * 
 * NOTE: in Actionscript 2, the capturing phase can not be caught.
 */
class com.dreamsocket.events.EventPhase 
{
	/**
	 * The target phase, which is the second phase of the event flow.
	 */
	public static var AT_TARGET:Number = 3;
	
	/**
	 * The bubbling phase, which is the third phase of the event flow.
	 */
	public static var BUBBLING_PHASE:Number = 3;
	
	private function EventPhase()
	{	
	}
}