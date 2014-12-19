module Twig
  class Connection
    attr_reader :connection, :username, :api_key, :api_version, :invoices, :clients, :payouts, :account

    #{username, api_key}
    def initialize(args={})
      @username = args[:username] || Twig.username
      @api_key = args[:api_key] || Twig.api_key
      @api_version = args[:api_version] || 'v1'

      setup_connection
      #setup_subresources
    end

    def inspect
      "<Twig::Connection @username=#{@username} @api_key=#{@api_key} @api_version=#{@api_version}>"
    end

    ##
    # Delegate user methods from the client. This saves having to call
    # <tt>client.user</tt> every time for resources on the default
    # user.
    def method_missing(method_name, *args, &block)
      if user.respond_to?(method_name)
        user.send(method_name, *args, &block)
      else
        super
      end
    end

    def respond_to?(method_name, include_private=false)
      if user.respond_to?(method_name, include_private)
        true
      else
        super
      end
    end

    private

    def setup_subresources
      @invoices  = Twig::Invoice.new(self)
      @clients   = Twig::Client.new(self)
      @payouts   = Twig::Payout.new(self)
      @account   = Twig::Account.new(self)
    end

    def setup_connection
      @connection = Faraday.new(url: "http://localhost:3000/api/#{@api_version}") do |f|
        f.request :url_encoded
        f.response :logger
        f.adapter Faraday.default_adapter
        f.headers['Content-Type'] = 'application/vnd.api+json'
      end
    end

  end
end