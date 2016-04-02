class RemoveImagesFromDocument < ActiveRecord::Migration
  def change
    remove_column :documents, :images
  end
end
