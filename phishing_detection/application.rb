require "sinatra/base"
require 'json'
require 'rack'
require 'rack/contrib'
require_relative 'httpconnector/phish_tank'
require_relative 'app/phish_tank_checker'

class MyApp < Sinatra::Base
  use Rack::PostBodyContentTypeParser

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

  phish_tank = PhishTankChecker.new

  post "/is_phish_url" do
    content_type :json
    phish_tank.check_url(url: params[:url]).to_json
  end

  options "*" do
    response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end

  run!
end
