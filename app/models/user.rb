class User < ApplicationRecord
  has_secure_password
  has_secure_password :recovery_password, validations: false
  has_one :tab, class_name: 'Tab', foreign_key: :id

end
