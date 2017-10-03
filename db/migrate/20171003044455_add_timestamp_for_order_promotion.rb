class AddTimestampForOrderPromotion < ActiveRecord::Migration
  def change
    add_column :spree_order_promotions, :created_at, :datetime, null: false
    add_column :spree_order_promotions, :updated_at, :datetime, null: false
  end
end
