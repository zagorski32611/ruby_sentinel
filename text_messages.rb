module TextMessages
    require 'rubygems'
    require 'twilio-ruby'
    require './super_secret_passwords.rb'
    ACCOUNT_SID = Secrets.twilio_sid
    AUTH_TOKEN = Secrets.twilio_token
    CLIENT = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    @from = Secrets.sender
    @to = Secrets.recipients
    
    def self.send_text(words, *)
        CLIENT.api.account.messages.create(from: @from, to: @to, body: words)
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