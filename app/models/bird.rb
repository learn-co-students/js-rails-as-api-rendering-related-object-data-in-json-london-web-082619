class Bird < ApplicationRecord
    has_many :sightings
    has_many :location, through: :sightings
end