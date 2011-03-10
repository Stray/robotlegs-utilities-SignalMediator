package org.robotlegs.mvcs {

	import asunit.framework.TestCase; 
	import org.osflash.signals.Signal;
	import org.robotlegs.core.ISignalMap;

	public class SignalMapTest extends TestCase {
		protected var signalMap:ISignalMap;
        protected var listenerExecuted:Boolean;
		protected var listenerExecutedCount:uint;
		protected var sampleSignal:Signal;
		protected var secondSampleSignal:Signal;

		public function SignalMapTest(methodName:String=null) {
			super(methodName);
		}

		override protected function setUp():void {
			super.setUp();
			signalMap = new SignalMap();
			sampleSignal = new Signal();
			secondSampleSignal = new Signal();
		}

		override protected function tearDown():void {
			resetListenerExecuted();
			resetListenerExecutedCount();
			super.tearDown();
			signalMap = null;            
			sampleSignal = null;
			secondSampleSignal = null;
		}

		public function testInstantiated():void {
			assertTrue("signalMap is SignalMap", signalMap is SignalMap);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function no_mappings_results_in_no_listener_response():void
		{
			sampleSignal.dispatch();
			assertFalse('Listener should NOT have reponded to event', listenerExecuted);
		} 
		
		public function test_addToSignal_repeatedly_handles_dispatch():void {
			signalMap.addToSignal(sampleSignal, listener);
			assertEquals("signal has not fired yet", 0, listenerExecutedCount);
			sampleSignal.dispatch();
			assertEquals("addToSignal handles first dispatch", 1, listenerExecutedCount);
			sampleSignal.dispatch();
			assertEquals("addToSignal handles second dispatch", 2, listenerExecutedCount);
		}
		
		public function test_addOnceToSignal_only_handles_dispatch_once():void {
			signalMap.addOnceToSignal(sampleSignal, listener);
			assertEquals("signal has not fired yet", 0, listenerExecutedCount);
			sampleSignal.dispatch();
			assertEquals("addOnceToSignal handles first dispatch", 1, listenerExecutedCount);
			sampleSignal.dispatch();
			assertEquals("addOnceToSignal doesn't handle second dispatch", 1, listenerExecutedCount);
		}
		
		public function test_removeFromSignal_removes_the_listener():void {
			signalMap.addToSignal(sampleSignal, listener);
			assertEquals("signal has not fired yet", 0, listenerExecutedCount);
			sampleSignal.dispatch();
			assertEquals("addToSignal handles first dispatch", 1, listenerExecutedCount);
			signalMap.removeFromSignal(sampleSignal, listener);
			sampleSignal.dispatch();
			assertEquals("addToSignal doesn't handle second dispatch after removeFromSignal", 1, listenerExecutedCount);
		} 
		
		public function test_removeAll_removes_all_registered_listeners():void {      
			signalMap.addToSignal(sampleSignal, listener);
			signalMap.addToSignal(sampleSignal, alternativeListener1);
			signalMap.addToSignal(secondSampleSignal, listener);
			signalMap.addToSignal(secondSampleSignal, alternativeListener2);
			
			sampleSignal.dispatch();
			secondSampleSignal.dispatch();
			
			assertEquals("All expected signals have been received", 4, listenerExecutedCount);
			
			signalMap.removeAll();
			
			sampleSignal.dispatch();
			secondSampleSignal.dispatch();

			assertEquals("No more signals have been received", 4, listenerExecutedCount);
		} 
		
		public function test_removeAll_doesnt_error_if_some_listeners_added_with_addOnce():void {      
			signalMap.addToSignal(sampleSignal, listener);
			signalMap.addOnceToSignal(sampleSignal, alternativeListener1);
			signalMap.addOnceToSignal(secondSampleSignal, listener);
			signalMap.addToSignal(secondSampleSignal, alternativeListener2);
			
			sampleSignal.dispatch();
			secondSampleSignal.dispatch();
			
			assertEquals("All expected signals have been received", 4, listenerExecutedCount);
			
			signalMap.removeAll();
			
			sampleSignal.dispatch();
			secondSampleSignal.dispatch();

			assertEquals("No more signals have been received", 4, listenerExecutedCount);
		}
		
		
		// Helpers
		protected function listener():void
		{
			listenerExecuted = true;  
			listenerExecutedCount++;
		}
		
		protected function alternativeListener1():void
		{
			listenerExecuted = true;  
			listenerExecutedCount++;
		} 
		
		protected function alternativeListener2():void
		{
			listenerExecuted = true;  
			listenerExecutedCount++;
		}

		protected function resetListenerExecuted():void
		{
			listenerExecuted = false;
		}

		protected function resetListenerExecutedCount():void {
			listenerExecutedCount = 0;
		}        
	}
}