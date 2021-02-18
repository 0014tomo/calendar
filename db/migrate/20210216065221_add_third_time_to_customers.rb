class AddThirdTimeToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :third_time, :date
    add_column :customers, :fourth_time, :date
  end
end
