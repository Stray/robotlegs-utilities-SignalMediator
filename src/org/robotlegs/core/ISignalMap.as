package org.robotlegs.core
{
	import org.osflash.signals.ISignal;

	public interface ISignalMap
	{
		function addToSignal(signal:ISignal, handler:Function):void;

		function addOnceToSignal(signal:ISignal, handler:Function):void;
		
		function removeFromSignal(signal:ISignal, handler:Function):void;
		
		function removeAll():void;
	
	} 

}