Wisper Mailing
===

Proof of concept for using [Wisper][1] in a Rails project to trigger mails.

The idea is to use [Wisper][1] to send messages between application components and decouple business logic in controllers
 from mailing tasks.
 
I'll be breaking this in several steps. First step is to make Wisper work (duh). Second step is to make it send simple
 whenever an action is called inside a controller (mocking some logic). Finally, decouple the controllers and the mailing
 module in two separate engines.
 
The business module will act as the publisher (as it shouldn't care if mails are sent or not) and the mailing module
 will be the subscriber. In theory, this would allow to replace the mailing module with something else that publishes
 messages into a queue (RabbitMQ, Amazon's SQS, etc.) so workers in distributed servers can handle the mailing.
 
For simplicity's sake, I won't be writing tests. (Sorry!)
 
I'll consider this proof of concept successful if Wisper's footprint in the controllers codebase is less than 3 LOC per
 action. (Probably this criteria will change)
 
# Part 1 \& 2

In the main app, there is a scaffolded model called `MyModel`. I'm using Wisper to "log" what happens with this model. 

In `app/controller/my_models_controller.rb`, I placed `broadcast`s on the main controller actions (`create`, `update`, 
 `destroy`). In `config/initializers/wisper_subscriber.rb`, I setup an array as a "message storage" and create a global
 listener in the `LoggingListener` class. 
 
You can find all listeners in `app/listeners`.

Finally, to see it in action, I modified `app/views/layouts/application.html.erb` to display all the messages.

Up to now, only `/my_models` has any content (HTTP).

# Part 3 (engines and mailing)

`Engine1` was created in the `engines/` directory. The purpose here is to test App -> Engine and Engine -> App 
 communication through Wisper.
 
In the first scenario, App -> Engine, I created a new global listener `MailingListener` in Engine1 in `engine1/app/listeners`.
 The listener is initialized at `engine1/config/initializers/wisper_listeners.rb`. In the App, I attached the broadcast 
 to the create callback of the App's `MyModel`. In this example, instead of sending an actual mail, I just echo the 
 created model on the stdout.
 
In theory, you could use this scenario to setup an app watching module. Logging activity and exceptions beyond stdout,
 send mails or post messages to remote queues, are some of the tasks that come to mind. The application would be decoupled
 from this module; you could change the implementation without impacting the application.
 
The second scenario is similar but the other way around. The application will be hearing the engine(s). How is this useful? 
 Hexagonal Architecture comes to mind. I have no particular use case for this yet, but... It can be done anyway.
 
In this scenario, Engine1's `AnotherModel` has an update callback; if the model's `id` is even (just to make it interesting)
 another message will be broadcasted so that our `LoggingListener` can catch the message and create another message to
 our **Part 1** message array. 
  
# Part 4 (engine to engine)

In this final part, I'll be attempting to communicate two engines using Wisper. This might be my main use case since 
 I'm using engines to divide different POVs of the same application.
 
For this task, `Engine1` will be the publisher and `Engine2` will be the listener. Whenever a `AnotherModel` is created,
 it's controller will broadcast the event. `QueueListener` (`engines/engine2/app/listeners/queue_listener.rb`) will be 
 the corresponding listener. It will simulate the push of a message to a remote queue, so I'll be using Wisper's async 
 option for this events. (This gives me the idea to do a Wisper-RabbitMQ plugin or even a SQS one... we'll see).
 
 

[1]: https://github.com/krisleech/wisper    "Wisper"