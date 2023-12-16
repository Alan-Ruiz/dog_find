class Dog < ApplicationRecord
  validates :name, presence: true
  validates :breed, presence: true
  belongs_to :dog_owner, polymorphic: true
end
  