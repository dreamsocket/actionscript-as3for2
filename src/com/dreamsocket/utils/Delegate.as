//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.

/**
 *	The Delegate class creates a function wrapper to let you run a function in the context
 *	of the original object, rather than in the context of the second object, when you pass a
 *	function from one object to another.
 */
class com.dreamsocket.utils.Delegate
{
	private function Delegate(){}

	/**
	 * Creates a functions wrapper for the original function so that it runs in the provided context.
	 * @parameter p_o Context in which to run the function.
	 * @paramater p_funct Function to run.
	 */
	static function create(p_o:Object, p_funct:Function):Function
	{
		var args:Array = arguments;
		args.shift();args.shift();
		
		return function():Object
		{
			return p_funct.apply(p_o, arguments.concat(args));
		};
	}
}