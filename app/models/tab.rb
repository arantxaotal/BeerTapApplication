class Tab < ApplicationRecord

  has_one :user
  belongs_to :beer_type, inverse_of: :tab, optional: true

  def beer_type_name
    beer_type.try(:name)
  end

end
