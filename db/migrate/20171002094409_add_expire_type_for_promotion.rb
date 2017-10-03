class AddExpireTypeForPromotion < ActiveRecord::Migration
  def change
    add_column :spree_promotions, :expiry_type, :integer, default: 0
    add_column :spree_promotions, :expiry_after_applied, :integer, default: 3600
    add_column :spree_promotions, :expiry_after_applied_floor_to, :integer, default: 3600
  end
end
