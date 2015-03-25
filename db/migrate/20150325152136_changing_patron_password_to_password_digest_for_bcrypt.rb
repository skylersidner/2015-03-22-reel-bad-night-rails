class ChangingPatronPasswordToPasswordDigestForBcrypt < ActiveRecord::Migration
  def change
    change_table :patrons do |t|
      t.rename :password, :password_digest
    end
  end
end
