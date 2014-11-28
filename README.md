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
 
I'll consider this proof of concept a success if Wisper's footprint in the controllers codebase is less than 3 LOC per
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

I'm currently setting up the engines...

[1]: https://github.com/krisleech/wisper    "Wisper"