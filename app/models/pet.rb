class Pet < ApplicationRecord
    validates :owner_id, presence: true
    validates :name, presence: true
    validates :breed, presence: true
    validates :color, presence: true
end
