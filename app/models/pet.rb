class Pet < ApplicationRecord
  validates_presence_of :image, :name, :approximate_age, :description, :sex, :shelter_id, :status
  belongs_to :shelter
end