class SetDefaultValueToDocumentCount < ActiveRecord::Migration
  def change
    change_column :documents, :count, :integer, :default => 0
  end
end
