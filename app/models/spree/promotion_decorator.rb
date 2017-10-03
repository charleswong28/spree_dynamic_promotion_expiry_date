module Spree
  Promotion.class_eval do
    enum expiry_type: [:default, :after_applied, :after_applied_with_floor_to]
    attr_accessor :order_promotion

    # called anytime order.update_with_updater! happens
    def eligible?(promotable)
      result = !expired? && !usage_limit_exceeded?(promotable) && !blacklisted?(promotable) && !!eligible_rules(promotable, {})

      if (expiry_type == 'after_applied' || expiry_type == 'after_applied_with_floor_to') && order_promotion(promotable)
        result = result && !order_promotion(promotable).expired?
      end
      
      result
    end

    def order_promotion(order)
      @order_promotion ||= Spree::OrderPromotion.where(order: order, promotion: self).first
    end
  end
end