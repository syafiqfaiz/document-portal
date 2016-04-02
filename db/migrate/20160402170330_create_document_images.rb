class CreateDocumentImages < ActiveRecord::Migration
  def change
    create_table :document_images do |t|
      t.string :image
      t.string :document_id
      t.timestamps null: false
    end
  end
end
