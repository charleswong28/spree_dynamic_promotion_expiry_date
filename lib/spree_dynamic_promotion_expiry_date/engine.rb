module SpreeDynamicPromotionExpiryDate
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_dynamic_promotion_expiry_date'

    config.autoload_paths += %W(#{config.root}/lib) 
    
    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      cache_klasses = %W(#{config.root}/app/**/*_decorator*.rb #{config.root}/app/overrides/*.rb #{config.root}/lib/**/*_decorator.rb)

      Dir.glob(cache_klasses) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
