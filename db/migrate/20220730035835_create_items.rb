class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      t.integer :detail_category_id
      t.integer :detail_condition_id
      t.integer :delivery_charge_id
      t.integer :prefecture_id
      t.integer :delivery_date_id
      t.integer :price
      t.references :user
      t.timestamps
    end
  end
end
