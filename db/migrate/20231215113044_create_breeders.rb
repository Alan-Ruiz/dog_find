class CreateBreeders < ActiveRecord::Migration[7.1]
  def change
    create_table :breeders do |t|
      t.string :name
      t.string :breed
      t.text :description
      t.timestamps
    end
  end
end
