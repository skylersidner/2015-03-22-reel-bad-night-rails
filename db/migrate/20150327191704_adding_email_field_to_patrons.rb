class AddingEmailFieldToPatrons < ActiveRecord::Migration
  def change
    add_column :patrons, :email, :string
  end
end
