class User < ApplicationRecord
  has_secure_password
  has_secure_password :recovery_password, validations: false
  belongs_to :tab, inverse_of: :user, optional: true
  enum role: { client: 0, dispenser: 1 }
end
