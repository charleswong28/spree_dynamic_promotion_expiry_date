module Spree
  Promotion.class_eval do
    enum expiry_type: [:default, :after_applied, :after_applied_with_floor_to]
  end
end