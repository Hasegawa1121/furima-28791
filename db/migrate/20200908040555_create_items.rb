class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :image
      t.integer :category_id
      t.integer :condition_id
      t.integer :postage_payer_id
      t.integer :prefecture_id
      t.integer :handling_id
      t.integer :price

      t.timestamps
    end
  end
end
