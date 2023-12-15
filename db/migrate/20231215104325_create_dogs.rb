class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.text :description
      t.date :date_of_birth
      t.boolean :rescue, default: false
      t.boolean :breeder, default: false
      t.timestamps
    end
  end
end
