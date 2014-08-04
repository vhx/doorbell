require 'sinatra'
require 'twilio-ruby'

module Vhx
  class Doorbell < Sinatra::Base

    configure do
      set :root, File.dirname(__FILE__)
      set :logger, $logger

      set :public_folder, 'public'

      set :raise_errors, false
      set :show_exceptions, false
    end

    not_found do
      erb :error
    end

    error 400..510 do
      erb :error
    end

    get '/recent' do
      @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN']

      @messages = []
      @client.account.messages.list({ to: ENV['TWILIO_PHONE_NUMBER'] }).each do |message|
        @messages << message
      end
      @messages.shuffle!

      erb :recent
    end

    post '/dingdong_sms' do
      erb :sms_response
    end

    post '/dingdong_call' do
      erb :caller_response
    end
  end
end