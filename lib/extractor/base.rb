module Extractor
  class Base
    def self.load(auth)
      provider = auth['provider'].classify

      "Extractor::#{provider}".constantize.new(auth)
    rescue NameError
      fail "#{provider} is not a valid extractor!"
    end

    attr_reader :auth

    def initialize(auth)
      @auth = auth.with_indifferent_access
    end

    def provider
      auth[:provider]
    end

    def name
      auth[:info][:name]
    end

    def email
      auth[:info][:email]
    end

    def uid
      auth[:uid]
    end
  end
end
