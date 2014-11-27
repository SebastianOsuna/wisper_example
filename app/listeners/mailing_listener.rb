class MailingListener
    def create_model_success model
        puts '#'*50
        p model
        puts '#'*50
    end
    def create_model_error model
        puts '='*50
        p model
        puts '='*50
    end
end