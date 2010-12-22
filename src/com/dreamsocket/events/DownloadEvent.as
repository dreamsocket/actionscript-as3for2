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


import com.dreamsocket.events.Event;

/**
 * The DownloadEvent class is dispatched when a file is being downloaded to a user's computer.
*/		
class com.dreamsocket.events.DownloadEvent extends Event
{
	public static var DOWNLOAD_AVAILABLE:String = "downloadAvailable";
	public static var DOWNLOAD_CANCELLED:String = "downloadCancelled";
	public static var DOWNLOAD_COMPLETED:String = "downloadCompleted";
	public static var DOWNLOAD_FAILED:String = "downloadFailed";			
	public static var DOWNLOAD_PROGRESSED:String = "downloadProgressed";
	public static var DOWNLOAD_REQUESTED:String = "downloadRequested";
	public static var DOWNLOAD_STARTED:String = "downloadStarted";
		

	/** @private */
	private var m_currProgress:Number;
	/** @private */
	private var m_totalProgress:Number;

	
	public function DownloadEvent(p_type:String, p_currentProgress:Number, p_totalProgress:Number, p_bubbles:Boolean)
	{
		super(p_type, p_bubbles);
		
		this.m_currProgress = isNaN(p_currentProgress) ? 0 : p_currentProgress;
		this.m_totalProgress = isNaN(p_totalProgress) ? p_currentProgress : p_totalProgress;
	}
		
		
	/**
	 * Specifies the progress for the current item being downloaded.
	 * 
	 * <p>
	 * In the case of a byte range request current progress would reflect only the section of the file being downloaded.
	 * Developers could also use a download event for queued downloads where current progress was the progress of the current item in the queue. 
	 * </p>
	 */
	public function get currentProgress():Number
	{
		return this.m_currProgress;
	}

	/**
	 * Specifies the progress for the total amount being downloaded.
	 * 
	 * <p>
	 * In the case of a byte range request total progress would reflect the entire file, where current progress reflected
	 * only the specific file section requested.
	 * Developers could also use a download event for queued downloads where total progress was the progress of the total queue. 
	 * </p>
	 */
	public function get totalProgress():Number
	{
		return this.m_totalProgress;
	}
	
	
	/**
	 * Creates a copy of the DownloadEvent object that contains an exact property match as the original
	 */		
	public function clone():Event
	{
		return new DownloadEvent(this.type, this.currentProgress, this.totalProgress, this.bubbles);
	}
	
	/**
	 * Returns a String that contains all the properties of the DownloadEvent object. 
	 * The String has the following format:<br/>
	 * <code>
	 * [DownloadEvent type=value currentProgress=value totalProgress=value bubbles=value cancelable=value]
	 * </code>
	 */			
	public function toString():String
	{
		return this.formatToString("DownloadEvent", "type", "currentProgress", "totalProgress", "bubbles",  "cancelable");	
	}			
}
