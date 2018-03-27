module TextMessages
    require 'rubygems'
    require 'twilio-ruby'
    ACCOUNT_SID = "[SID]"
    AUTH_TOKEN = "[TOKEN]"
    CLIENT = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    @from ="[SENDER]"
    @to = "[RECIPIENT]"
   def self.send_text(words, *)
        CLIENT.api.account.messages.create(
            from: @from,
            to: @to,
            body: words
        )
    end
end




=begin
require 'rubygems'
require 'twilio-ruby'

account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxx'
auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyy'
client = Twilio::REST::Client.new account_sid, auth_token

from = '+15551234567' # Your Twilio number
to = '+15555555555' # Your mobile phone number

client.account.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
=end