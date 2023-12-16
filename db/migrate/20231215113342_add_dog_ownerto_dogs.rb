class AddDogOwnertoDogs < ActiveRecord::Migration[7.1]
  def change
    add_reference :dogs, :dog_owner, polymorphic: true, null: false, index: true
  end
end
