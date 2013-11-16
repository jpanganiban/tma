class ApplicationController < ActionController::Base
  protect_from_forgery

  def callback
    Credential.create(access_token:params[:access_token],subscriber:params[:subscriber_number])
  end

  def feed
    Credential.all.each do |sub|
      uri = URI.parse("http://devapi.globelabs.com.ph/smsmessaging/v1/outbound/5385/requests")
      uri.query="app_id=9dL6AsryyoGhRdcAq4iyMXhR9LnbsBaK&app_secret=8c7fd2453adb5859b3caf49d3a76f0662807dcb462a668f742feebe9fc4408e8"  
      response = Net::HTTP.post_form(uri, {"address" => sub.subscriber, "message" => "#{params[:msg_id]} #{params[:message]}"})
		end
  end
end
