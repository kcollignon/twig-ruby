$:.unshift File.dirname(__FILE__)

require 'faraday'
require 'faraday_middleware'
require 'faraday_middleware/multi_json'

Dir[File.dirname(__FILE__) + '/twig_invoicing/*.rb'].each do |file|
  require file
end


module Twig
  extend SingleForwardable

  def_delegators :api_key

  # Pre-configure with credentials so that you don't need to
  # pass them to various initializers each time.
  def self.configure(&block)
    yield configuration
  end

  # Returns an existing or instantiates a new configuration object.
  def self.configuration
    @configuration ||= Util::Configuration.new
  end
  private_class_method :configuration
end