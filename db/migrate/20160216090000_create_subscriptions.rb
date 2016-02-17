class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :plan, index: true, foreign_key: true
      t.decimal :amount_paid
      t.string :payment_method
      t.string :payment_id
      t.datetime :paid_at
      t.string :status
      t.datetime :end_at

      t.timestamps null: false
    end
  end
end