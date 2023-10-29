class Tab < ApplicationRecord

  belongs_to :user, class_name: 'User', inverse_of: :tab

end
