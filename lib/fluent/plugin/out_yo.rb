require "fluent/plugin/yo/version"

module Fluent
  class YoOutput < Fluent::Output
    config_param :api_key, :string, :default => nil
  end

  def initialize
    super
    require 'yo'
  end

  def configure(conf)
    super
    raise Fluent::ConfigError, 'Visit http://yoapi.justyo.co/ and get an api key' if !@api_key or @api_key.empty?
    @yo = Yo.new(@api_key)
  end

  def start; end
  def shutdown; end

  def emit(tag, es, chain)
    begin
      @yo.yo
    rescue => e
      raise Fluent::ConfigError, "Maybe Yo config is mistaken: #{e.class}, #{e.message}"
    end
    chain.next
  end
end
