//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.

import com.dreamsocket.events.EventDispatcher;
import com.dreamsocket.events.TimerEvent;

/**
 * The Timer class is the interface to timers, which let you run code on a specified time sequence.
 * It is an ActionScript 2 implementation of the native ActionScript 3 Timer. 
 * Use the start() method to start a timer. Add an event listener for the timer event to set up code to be run on the timer interval.
 *
 * <p>
 * You can create Timer objects to run once or repeat at specified intervals to execute code on a schedule. 
 * Depending on the SWF file's framerate or Flash Player's environment (available memory and other factors), 
 * Flash Player may dispatch events at slightly offset intervals. 
 * For example, if a SWF file is set to play at 10 frames per second (fps), which is 100 millisecond intervals, 
 * but your timer is set to fire an event at 80 milliseconds, the event will be dispatched close to the 100 millisecond interval. 
 * Memory-intensive scripts may also offset the events.
 * </p>
 * 
 * @see http://livedocs.adobe.com/flex/3/langref/flash/utils/Timer.html
 */
class com.dreamsocket.utils.Timer extends EventDispatcher
{
	private var m_complete:Boolean;
	private var m_currCt:Number;
	private var m_delay:Number;
	private var m_repeatCt:Number;
	private var m_running:Boolean;
	private var m_startTime:Number;
	private var m_timeOffset:Number;
	private var m_intervalID:Number;
	
	
	public function Timer(p_delay:Number, p_repeatCt:Number)
	{	
		super(this);
		
		this.m_currCt = 0;
		this.m_delay = isNaN(p_delay) ? 0 : p_delay;
		this.m_repeatCt = isNaN(p_repeatCt) ? 0 : p_repeatCt;
		this.m_running = false;
		this.m_complete = false;
		this.m_timeOffset = 0;
	}
	
	
	/**
	 * The total number of times the timer has fired since it started at zero. 
	 * If the timer has been reset, only the fires since the reset are counted. 
	 */
	public function get currentCount():Number
	{
		return this.m_currCt;
	}
	
	
	/**
	 * The delay, in milliseconds, between timer events. 
	 * If you set the delay interval while the timer is running, the timer will restart at the same repeatCount iteration. 
	 */
	public function set delay(p_n:Number):Void
	{
		this.m_delay = p_n;
	}


	/**
	 * The delay, in milliseconds, between timer events. 
	 * If you set the delay interval while the timer is running, the timer will restart at the same repeatCount iteration. 
	 */
	public function get delay():Number
	{
		return this.m_delay;
	}
	
	/**
	 * The total number of times the timer is set to run. 
	 * If the repeat count is set to 0, the timer continues forever or until the stop() method is invoked or the program stops. 
	 * If the repeat count is nonzero, the timer runs the specified number of times. 
	 * If repeatCount is set to a total that is the same or less then currentCount  the timer stops and will not fire again. 
	 */	
	public function get repeatCount():Number
	{
		return this.m_repeatCt;
	}
	
		 
	public function set repeatCount(p_n:Number):Void
	{
		this.m_repeatCt = p_n;
	}

	
	/**
	 * The timer's current state; true if the timer is running, otherwise false.
	 */
	public function get running():Boolean
	{
		return this.m_running;
	}
	
	
	/**
	 * Stops the timer, if it is running, and sets the currentCount property back to 0, like the reset button of a stopwatch. 
	 * Then, when start() is called, the timer instance runs for the specified number of repetitions, as set by the repeatCount value. 
	 */
	public function reset():Void
	{
		this.stop();
		this.m_currCt = 0;
		this.m_timeOffset = 0;
		this.m_complete = false;
	}
	
	
	/**
	 * Starts the timer, if it is not already running.
	 */
	public function start():Void
	{
		if(this.m_running || this.m_complete) return;
		
		clearInterval(this.m_intervalID);
		this.m_startTime = getTimer();
		this.m_running = true;
		this.m_intervalID = setInterval(this, "onInterval", this.m_delay - this.m_timeOffset);
		
	}
	
	
	/**
	 * Stops the timer. 
	 * When start() is called after stop(), the timer instance runs for the remaining number of repetitions, as set by the repeatCount property. 
	 */
	public function stop():Void
	{
		if(!this.m_running) return;
		
		clearInterval(this.m_intervalID);
		this.m_timeOffset = getTimer() - this.m_startTime;
		this.m_running = false;
	}
	

	//-----------------------------------------------------------------
	//	PRIVATE : HANDLERS
		
	private function onInterval():Void
	{
		this.m_currCt++;
		clearInterval(this.m_intervalID);

		this.dispatchEvent(new TimerEvent(TimerEvent.TIMER));
		
		if(this.m_currCt < this.m_repeatCt || this.m_repeatCt == 0)
		{
			this.m_intervalID = setInterval(this, "onInterval", this.m_delay);
		}
		else
		{
			this.dispatchEvent(new TimerEvent(TimerEvent.TIMER_COMPLETE));
			this.m_running = false;
			this.m_complete = true;
		}
	}
}