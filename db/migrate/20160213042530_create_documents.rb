class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :description
      t.integer :count
      t.string :file
      t.belongs_to :category, index: true, foreign_key: true
      t.json :images
      t.string :slug

      t.timestamps null: false
    end
    add_index :documents, :slug, unique: true
  end
end
