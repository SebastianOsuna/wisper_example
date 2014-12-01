module Engine1
  class AnotherModel < ActiveRecord::Base
      include Wisper::Publisher

      after_update { |me| broadcast(:updated_another_model, me) if me.id.even? }

  end
end
