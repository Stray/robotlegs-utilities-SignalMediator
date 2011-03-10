package org.robotlegs.mvcs {

	import asunit.framework.TestCase;
	import org.robotlegs.mvcs.SignalMediatorSupport;
	import org.osflash.signals.Signal;

	public class SignalMediatorTest extends TestCase {
		private var instance:SignalMediatorSupport;
        protected var listenerExecutedCount:uint;

		public function SignalMediatorTest(methodName:String=null) {
			super(methodName);
		}

		override protected function setUp():void {
			super.setUp();
			instance = new SignalMediatorSupport(); 
			instance.sampleSignal = new Signal();
			instance.signalHandler = this.listener; 
			instance.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null; 
			listenerExecutedCount = 0;
		}

		public function testInstantiated():void {
			assertTrue("instance is SignalMediator", instance is SignalMediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		          
		public function test_onRegister_has_added_listener_to_the_signal():void {
			instance.sampleSignal.dispatch();
			assertEquals("OnRegister has added listener to the signal", 1, listenerExecutedCount);
		}   
		
		public function test_preRemove_unmaps_signals():void {
			instance.sampleSignal.dispatch();
			assertEquals("OnRegister has added listener to the signal", 1, listenerExecutedCount);
			instance.sampleSignal.dispatch();
			assertEquals("signal is still being listened to", 2, listenerExecutedCount);
			instance.preRemove();
			instance.sampleSignal.dispatch();
			assertEquals("preRemove has stopped the listening", 2, listenerExecutedCount);
		}
		
		
		
		// helpers
	    protected function listener():void
		{
			listenerExecutedCount++;
		}
	}
}