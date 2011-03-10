**A Signal equivalent for the EventMap**

The robotlegs `Mediator` makes use of the `EventMap` to help with automatic clean-up when the mediator is removed.

Without clean up, memory leaks and duplication of listeners can occur as your views come and go from the stage and your mediators are created and destroyed.

The `SignalMediator` provides a `SignalMap` to handle this unmapping for you when the mediator is removed.

**Usage**
               
Where your mediator makes use of a `Signal` - whether injected or on the view - extend `SignalMediator`.

Instead of registering a listener with a signal directly, make use of the `addToSignal` and `addOnceToSignal` methods.

	override public function onRegister():void
	{
		// add normally
		addToSignal(someInjectedSignal, someHandler);       
		
		// add once
		addOnceToSignal(view.submit, submitHandler);
	}   
	
The `SignalMediator` will then make use of the `SignalMap` to add the handlers to these signals, and when the mediator is destroyed the handlers will all be unmapped. (Via the preRemove() method which is called by the `MediatorMap` automatically when views leave the stage).

**To manually unmap a signal-listener**

The sugar methods `addToSignal` and `addOnceToSignal` are provided for convenience. You can also access the `SignalMap` property of the `SignalMediator` directly, and you should use this approach to manually remove a signal (for example in response to another signal or a normal event listener):

	signalMap.removeFromSignal(someInjectedSignal, someHandler);
	                                                                                                                                        
**You can also use the SignalMap outside of SignalMediator**

`SignalMap` itself has no dependencies and can be used within a complex view, a service or any other place it might be useful to you. Even a controller if you're into that kind of thing.