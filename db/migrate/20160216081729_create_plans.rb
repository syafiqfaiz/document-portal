class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.boolean :active

      t.timestamps null: false
    end
  end
end