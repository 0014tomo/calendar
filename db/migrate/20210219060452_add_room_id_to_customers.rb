class AddRoomIdToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :room_id, :integer
  end
end
