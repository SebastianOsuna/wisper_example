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

[1]: https://github.com/krisleech/wisper    "Wisper"