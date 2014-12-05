require 'bunny'
class QueueListener

    def initialize
        # From http://rubybunny.info/articles/getting_started.html

        # RabbitMQ running on localhost,
        # with the default port (5672),
        # username ("guest"),
        # password ("guest")
        # and virtual host ("/")
        @conn = Bunny.new
        @conn.start

        @channel = @conn.create_channel
        @q  = @channel.queue("bunny.examples.hello_world", :auto_delete => true)
        @x  = @channel.default_exchange
    end

    def engine1_another_model_created model
        # publish message to example queue
        @x.publish model.to_json, routing_key: @q.name
    end
end