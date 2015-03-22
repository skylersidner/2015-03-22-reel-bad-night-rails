class CreateEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :start_time
      t.text :host_msg
      t.integer :current_event
      t.integer :film_id
    end
  end
end
