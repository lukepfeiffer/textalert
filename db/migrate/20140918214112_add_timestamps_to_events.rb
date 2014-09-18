class AddTimestampsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :created_at, :timestamp
  end
end
