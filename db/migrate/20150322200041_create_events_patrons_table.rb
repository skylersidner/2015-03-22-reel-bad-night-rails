class CreateEventsPatronsTable < ActiveRecord::Migration
  def change
    create_table :events_patrons do |t|
      t.integer :event_id
      t.integer :patron_id
    end
  end
end
