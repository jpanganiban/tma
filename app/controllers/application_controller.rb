require 'net/http'

class ApplicationController < ActionController::Base
  protect_from_forgery
  require 'net/http'

  def callback
    if not params[:subscriber_number]
      puts "Subscriber number does not exist"
      render json: {error: "Required parameter 'subscriber_number'"} and return
    end

    Credential.create(access_token:params[:access_token],subscriber:params[:subscriber_number])
    render json: {success: true}
  end

  def feed
    Credential.all.each do |sub|
      uri = URI.parse("http://devapi.globelabs.com.ph/smsmessaging/v1/outbound/5385/requests")
      uri.query="app_id=9dL6AsryyoGhRdcAq4iyMXhR9LnbsBaK&app_secret=8c7fd2453adb5859b3caf49d3a76f0662807dcb462a668f742feebe9fc4408e8&passphrase=globelabsawesome"
      response = Net::HTTP.post_form(uri, {"address" => sub.subscriber, "message" => "#{params[:msg_id]} #{params[:message]}"})
      puts response
      puts "SENDING SMS TO: #{sub.subscriber}"
		end

    render json: {success: true}
  end

  def reply
    message = params['message_payload']['message'].downcase.gsub('reply ','')
    msg = params['message_payload']['message'].split(' ')[0].downcase
    # TODO: Replace code with notify ReliefBoard API
    if msg.eql?('reply')
      Credential.all.each do |sub|
      uri = URI.parse("http://devapi.globelabs.com.ph/smsmessaging/v1/outbound/5385/requests")
      uri.query="app_id=9dL6AsryyoGhRdcAq4iyMXhR9LnbsBaK&app_secret=8c7fd2453adb5859b3caf49d3a76f0662807dcb462a668f742feebe9fc4408e8&passphrase=globelabsawesome"
      response = Net::HTTP.post_form(uri, {"address" => sub.subscriber, "message" => "#{params[:msg_id]} #{params[:message]}"})
      end
    end
  end
end
