class LoggingListener
    def create_model_success model
        MESSAGES << "New model created (#{model.id})"
    end
    def create_model_error model
        MESSAGES << "Error creating model (#{model.errors.size} errors}"
    end
    def model_destroyed
        MESSAGES << 'Model destroyed'
    end
    def edit_model_success model
        MESSAGES << "Model #{model.id} edited successfully"
    end
    def edit_model_error model
        MESSAGES << "#{model.errors.size} errors while editing model #{model.id}"
    end
    def updated_another_model model
        MESSAGE << "Event from Engine1: #{model.inspect} updated"
    end
end