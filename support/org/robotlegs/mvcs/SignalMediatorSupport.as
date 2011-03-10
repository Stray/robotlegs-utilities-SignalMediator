package org.robotlegs.mvcs {
	                                 
	import org.robotlegs.mvcs.SignalMediator;
	import org.osflash.signals.Signal;
	
	public class SignalMediatorSupport extends SignalMediator {
		
		// Testable vars
		public var sampleSignal:Signal; 
		public var signalHandler:Function;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		
		public function SignalMediatorSupport() {			
			// pass constants to the super constructor for properties
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
	   
		public override function onRegister():void
		{
			addToSignal(sampleSignal, signalHandler);
		}  
		
	}
}
