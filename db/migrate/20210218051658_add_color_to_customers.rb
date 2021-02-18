class AddColorToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :color, :string
  end
end
