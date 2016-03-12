class AddAttributeToSubscriptionTable < ActiveRecord::Migration
  def change
    add_column :subscriptions, :tranID, :string
    add_column :subscriptions, :mol_status, :string
    add_column :subscriptions, :skey, :string
    add_column :subscriptions, :paydate, :datetime

  end
end
