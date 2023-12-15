require 'rails_helper'

RSpec.describe Dog, type: :model do
  it "is valid with valid attributes" do
    dog = Dog.new(
      name: 'Rex',
      breed: 'Labrador',
      date_of_birth: Date.new(2020, 1, 1),
      rescue: true
      # Add other attributes here
    )
    expect(dog).to be_valid
  end

  it "is not valid without a name" do
    dog = Dog.new(name: nil)
    expect(dog).not_to be_valid
  end

  # Add more tests for other attributes and methods
end
