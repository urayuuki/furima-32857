class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      
      t.string :post_num ,null: false
      t.integer :shipment_source_id ,null: false
      t.string :city , null: false
      t.string :address , null: false
      t.string :build_name
      t.string :phone_num ,null: false 
      
      t.references :order, null: false ,foreign_key: true

      t.timestamps
    end
  end
end
