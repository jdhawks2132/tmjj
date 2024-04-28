class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :event_type
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :google_maps_link
      t.string :phone
      t.datetime :event_date_start
      t.datetime :event_date_end
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
