class User < ApplicationRecord
  has_secure_password
  has_secure_password :recovery_password, validations: false
  belongs_to :tab, inverse_of: :user

end
