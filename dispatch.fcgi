#!/usr/bin/env ruby

require 'rubygems'

module Rack
  class Request
    def path_info
      @env["REDIRECT_URL"].to_s
    end
    def path_info=(s)
      @env["REDIRECT_URL"] = s.to_s
    end
  end
end

require_relative 'app'

builder = Rack::Builder.new do
  use Rack::ShowStatus
  use Rack::ShowExceptions

  map '/' do
    run Sinatra::Application
  end
end

Rack::Handler::FastCGI.run(builder)


