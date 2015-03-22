class CreateDrinksTable < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.text :name
      t.text :category
      t.text :description
      t.integer :event_id
    end
  end
end
