class Credential < ActiveRecord::Base
  attr_accessible :access_token, :subscriber, :subscription
end
