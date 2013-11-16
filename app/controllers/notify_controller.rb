class NotifyController < ApplicationController


  def callback 
    Credential.create(access_token:params[:access_token],subscriber:params[:subscriber_number])
  end

  def reply
  	#endpoint
  end

  def feed    
    Credential.all.each do |sub|
<<<<<<< HEAD
   	uri = URI.parse("http://devapi.globelabs.com.ph/smsmessaging/v1/outbound/5385/requests")
    uri.query="app_id=9dL6AsryyoGhRdcAq4iyMXhR9LnbsBaK&app_secret=8c7fd2453adb5859b3caf49d3a76f0662807dcb462a668f742feebe9fc4408e8"  
    response = Net::HTTP.post_form(uri, {"address" => sub.subscriber, "message" => "#{params[:msg_id]} #{params[:message]}"})
		end
  end

end
=======
      uri = URI.parse("http://devapi.globelabs.com.ph/smsmessaging/v1/outbound/5385/requests")
      uri.query="app_id=&app_secret"
      response = Net::HTTP.post_form(uri, {"address" => sub.subscriber, "message" => "#{params[:msg_id]} #{params[:message]}"})
		end
  end
end
>>>>>>> 73cd65b32b02b821dd7798d983440fcd4f0d2e11
