//Copyright (C) 2008 Dreamsocket, Inc. All Rights Reserved.
//The following document is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying this product.


/**
 * The SoundTransform class contains properties for volume and panning. 
 * 
 * <p>
 * This class is meant to serve as an ActionScript 2 emulation of the ActionScript 3 native SoundTransform class.
 * It does this by providing a data object with the SoundTransform ActionScript 3 API, which can then be used to 
 * modify the equivalent properties on an AS2 Sound Object. When working with high level objects in the framework you can
 * use SoundTransform as you would in ActionScript 3 when assigning it to objects.
 * </p>
 */
class com.dreamsocket.media.SoundTransform 
{
	private var m_pan:Number;
	private var m_transform:Object;
	private var m_volume:Number;
	
	
	public function SoundTransform(p_volume:Number, p_pan:Number)
	{
		this.m_pan = isNaN(p_pan) ? 0 : p_pan;
		this.m_volume = isNaN(p_volume) ? 1 : p_volume;
		this.m_transform = {
			ll:100,
			lr:0,
			rl:0,
			rr:100
		};
	}
	
	
	/**
	 * A value, from 0 (none) to 1 (all), specifying how much of the left input is played in the left speaker. 
	 */
	public function get leftToLeft():Number
	{
	 	return this.m_transform.ll/100;		
	}
	
	
	public function set leftToLeft(p_value:Number):Void
	{
		var val:Number = p_value * 100;
		
		if(val != this.m_transform.ll)
		{
			this.m_transform.ll = val;	
		}
	}	
	
	/**
	 * A value, from 0 (none) to 1 (all), specifying how much of the left input is played in the right speaker. 
	 */
	public function get leftToRight():Number
	{
	 	return this.m_transform.lr/100;	
	}
	
	
	public function set leftToRight(p_value:Number):Void
	{
		var val:Number = p_value * 100;
		
		if(val != this.m_transform.lr)
		{
			this.m_transform.lr = val;	
		}				
	}	
		
	
	/**
	 * The left-to-right panning of the sound, ranging from -1 (full pan left) to 1 (full pan right). 
	 * A value of 0 represents no panning (balanced center between right and left). 
	 */	
	public function get pan():Number
	{
	 	return this.m_pan;	
	}
	
	
	public function set pan(p_value:Number):Void
	{
		var val:Number = Math.max(Math.min(1, p_value), -1);
		
		if(this.m_pan != val)
		{
			this.m_pan = val;
		}
	}
	
	
	/**
	 * A value, from 0 (none) to 1 (all), specifying how much of the right input is played in the left speaker. 
	 */
	public function get rightToLeft():Number
	{
	 	return this.m_transform.rl/100;	
	}
	
	
	public function set rightToLeft(p_value:Number):Void
	{
		var val:Number = p_value * 100;
		
		if(val != this.m_transform.rl)
		{
			this.m_transform.rl = val;	
		}			
	}	
	
	
	/**
	 * A value, from 0 (none) to 1 (all), specifying how much of the right input is played in the right speaker. 
	 */
	public function get rightToRight():Number
	{
	 	return this.m_transform.rr/100;	
	}
	
	
	public function set rightToRight(p_value:Number):Void
	{
		var val:Number = p_value * 100;
		
		if(val != this.m_transform.rr)
		{
			this.m_transform.rr = val;	
		}				
	}
			
	
	/**
	 * The volume, ranging from 0 (silent) to 1 (full volume). 
	 */	
	public function get volume():Number
	{
	 	return this.m_volume;	
	}
	
	
	public function set volume(p_value:Number):Void
	{
		var val:Number = Math.max(Math.min(1, p_value), 0);
		
		if(this.m_volume != val)
		{
			this.m_volume = val;
		}		
	}
	
	
	/**
	 * Updates and ActionScript 2 Sound object with all of the properties of the soundTransform instance.
	 */
	public function updateSound(p_sound:Sound):Void
	{
		p_sound.setTransform(this.m_transform);
		p_sound.setVolume(this.m_volume * 100);
		p_sound.setPan(this.m_pan * 100);			
	}					
}
