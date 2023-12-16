class Rescue < ApplicationRecord
  has_many :dogs, as: :dog_owner, dependent: :destroy
end
