class SmsController < ApplicationController
  def new
  end

  def create
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.api.account.messages.create(
      from: '+33644600267',
      to: params[:sms][:phone],
      body: params[:sms][:body]
    )
  end
end
