class AddAttributeToSubscriptionTable < ActiveRecord::Migration
  def change
    add_column :subscriptions, :mol_status, :string
    add_column :subscriptions, :skey, :string

    rename_column :subscriptions, :payment_id, :tranID
    rename_column :subscriptions, :paid_at, :paydate
  end
end
