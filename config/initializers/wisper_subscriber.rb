# require 'wisper'
MESSAGES = []

Wisper.subscribe(LoggingListener.new)