class AddEndTimeToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :end_time, :date
  end
end
