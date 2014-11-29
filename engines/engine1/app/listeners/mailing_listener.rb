class MailingListener
    def send_mail model
        # mock mail sending
        puts "Sending email based on class #{model.class}. Data: #{model.inspect}"
        # ... mailing logic ...
    end
end
