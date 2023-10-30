class User < ApplicationRecord
  has_secure_password
  has_secure_password :recovery_password, validations: false
  belongs_to :tap, inverse_of: :user, optional: true
  enum role: { client: 0, dispenser: 1 }
  validates :name, presence: true
  validates :password_digest, presence: true
  validates :role_cd, presence: true
  validates_uniqueness_of :name
end
