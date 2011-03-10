package {
	/**
	 * This file has been automatically created using
	 * #!/usr/bin/ruby script/generate suite
	 * If you modify it and run this script, your
	 * modifications will be lost!
	 */

	import asunit.framework.TestSuite;
//	import org.robotlegs.mvcs.SignalMapTest;
	import org.robotlegs.mvcs.SignalMediatorTest;

	public class AllTests extends TestSuite {

		public function AllTests() {
//			addTest(new org.robotlegs.mvcs.SignalMapTest());
			addTest(new org.robotlegs.mvcs.SignalMediatorTest());
		}
	}
}
