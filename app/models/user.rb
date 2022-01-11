class User < ApplicationRecord
    has_secure_password

    paginates_per 5
end
