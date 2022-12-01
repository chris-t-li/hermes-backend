class User < ApplicationRecord
    has_one :sender
    has_one :receiver
end
