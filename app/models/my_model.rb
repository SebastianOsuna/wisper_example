class MyModel < ActiveRecord::Base
    include Wisper::Publisher

    after_create { |me| broadcast(:send_mail, me) }
end
