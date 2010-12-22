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
 
 
class com.dreamsocket.ui.Keyboard 
{
	public static var ALT         :Number =   18;
	public static var BACKSPACE   :Number =   8;
	public static var CAPS_LOCK   :Number =   20;
	public static var CONTROL     :Number =   17;
	public static var INSERT      :Number =   45;
	public static var DELETE	  :Number =   46;
	public static var DOWN        :Number =   40;
	public static var END         :Number =   35;
	public static var ENTER       :Number =   13;
	public static var ESCAPE      :Number =   27;
	public static var HOME        :Number =   36;
	public static var LEFT        :Number =   37;
	public static var PAGE_DOWN   :Number =   34;
	public static var PAGE_UP     :Number =   33;
	public static var RIGHT       :Number =   39;
	public static var SHIFT       :Number =   16;
	public static var SPACE       :Number =   32;
	public static var TAB         :Number =   9;
	public static var UP          :Number =   38;
	
	public static var F1          :Number =   112;
	public static var F2          :Number =   113;
	public static var F3          :Number =   114;
	public static var F4          :Number =   115;
	public static var F5          :Number =   116;
	public static var F6          :Number =   117;
	public static var F7          :Number =   118;
	public static var F8          :Number =   119;
	public static var F9          :Number =   120;
	public static var F10         :Number =   121;
	public static var F11         :Number =   122;
	public static var F12         :Number =   123;
	public static var F13         :Number =   124;
	public static var F14         :Number =   125;
	
	public static var NUMPAD_0			:Number = 96;
	public static var NUMPAD_1			:Number = 97;
	public static var NUMPAD_2			:Number = 98;
	public static var NUMPAD_3			:Number = 99;
	public static var NUMPAD_4			:Number = 100;
	public static var NUMPAD_5			:Number = 101;
	public static var NUMPAD_6			:Number = 102;
	public static var NUMPAD_7			:Number = 103;
	public static var NUMPAD_8			:Number = 104;
	public static var NUMPAD_9			:Number = 105;
	public static var NUMPAD_ADD		:Number = 107;
	public static var NUMPAD_DECIMAL	:Number = 110;
	public static var NUMPAD_DIVIDE		:Number = 111;
	public static var NUMPAD_ENTER		:Number = 108;
	public static var NUMPAD_MULTIPLY	:Number = 106;
	public static var NUMPAD_SUBTRACT	:Number = 109;
	
	
	private function Keyboard()
	{
	}
	
	
	public static function get capsLock():Boolean
	{
		return Key.isToggled(Key.CAPSLOCK);
	}
	

	public static function get numLock():Boolean
	{
		return Key.isToggled(144);
	}
	
	
	public static function isAccessible():Boolean
	{
		return Key.isAccessible();
	}
}
