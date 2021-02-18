class RenameStartTimeColumnToCustomers < ActiveRecord::Migration[5.0]
  def change
    rename_column :customers, :first_time, :start_time
  end
end
