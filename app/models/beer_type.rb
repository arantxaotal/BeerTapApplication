class BeerType < ApplicationRecord
  has_many :tap
  validates :name, presence: true
  validates :flow_volume, presence: true
  validates :prize_per_litre, presence: true
  validates_uniqueness_of :name
end
