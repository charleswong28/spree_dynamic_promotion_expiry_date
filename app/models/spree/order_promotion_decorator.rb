module Spree
  OrderPromotion.class_eval do
    def expires_at
      if promotion.expiry_type == 'after_applied' && created_at
        created_at + promotion.expiry_after_applied.seconds
      elsif promotion.expiry_type == 'after_applied_with_floor_to' && created_at
        (created_at + promotion.expiry_after_applied.seconds).floor(promotion.expiry_after_applied_floor_to)
      else 
        promotion.expires_at
      end
    end

    def expired?
      !!expires_at && Time.current > expires_at
    end
  end
end