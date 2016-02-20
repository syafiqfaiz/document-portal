class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :subscribe, :boolean, :default => false
    add_column :users, :subscribe_expired, :datetime
  end
end
