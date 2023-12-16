class CreateRescues < ActiveRecord::Migration[7.1]
  def change
    create_table :rescues do |t|
      t.string :name
      t.timestamps
    end
  end
end
