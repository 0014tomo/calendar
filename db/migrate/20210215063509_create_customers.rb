class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      
      t.string :customer_name, null: false
      t.text :content
      t.date :first_time, null: false
      t.date :second_time, null: false
      
      t.timestamps
      
    end
  end
end
