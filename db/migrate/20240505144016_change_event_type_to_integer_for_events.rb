class ChangeEventTypeToIntegerForEvents < ActiveRecord::Migration[7.1]
  def up
    change_column :events, :event_type, :integer, using: 'event_type::integer'
  end

  def down
    change_column :events, :event_type, :string
  end
end
