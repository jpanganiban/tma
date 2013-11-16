class NotifyController < ApplicationController


  def callback 
    Credential.create(access_token:params[:access_token],subscriber:params[:subscriber_number])
  end

  def reply
  	#endpoint
  end

  def feeds    
    Credential.all.each do |sub|
      uri = URI.parse("http://devapi.globelabs.com.ph/smsmessaging/v1/outbound/5385/requests")
      uri.query="app_id=&app_secret"
      response = Net::HTTP.post_form(uri, {"address" => sub.subscriber, "message" => "#{params[:msg_id]} #{params[:message]}"})
		end
  end
end
