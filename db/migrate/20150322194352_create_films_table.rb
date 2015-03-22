class CreateFilmsTable < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.text :title
      t.integer :year
      t.integer :length
      t.text :synopsis
      t.text :trailer
      t.integer :rt_rating
    end
  end
end
