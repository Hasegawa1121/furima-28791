class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :postal_code,   null: false, default: ""
      t.integer :prefecture_id, null: false, default: ""
      t.string  :city,          null: false, default: ""
      t.string  :addresses,     null: false, default: ""
      t.string  :building,      default: ""
      t.string  :phone_number,  null: false, default: ""

      t.timestamps
    end
  end
end
