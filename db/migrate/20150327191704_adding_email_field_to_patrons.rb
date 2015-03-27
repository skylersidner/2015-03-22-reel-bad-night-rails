class AddingEmailFieldToPatrons < ActiveRecord::Migration
  def change
    change_table :patrons do |t|
      add_column :email, :string
    end
  end
end
