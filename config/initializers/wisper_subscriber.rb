# require 'wisper'
MESSAGES = []

Wisper.subscribe(MailingListener.new)