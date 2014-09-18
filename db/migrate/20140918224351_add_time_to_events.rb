class AddTimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :send_at, :datetime
  end
end
