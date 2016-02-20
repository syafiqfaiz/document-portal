class AddColumnToUserFromGoogle < ActiveRecord::Migration
  def change
    add_column :users, :uid_google, :string
    add_column :users, :name, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :datetime
  end
end