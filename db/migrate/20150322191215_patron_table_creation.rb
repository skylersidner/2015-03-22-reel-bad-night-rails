class PatronTableCreation < ActiveRecord::Migration
  def change
    create_table :patrons do |t|
      t.text :first_name
      t.text :last_name
      t.text :username
      t.text :password
    end
  end
end
