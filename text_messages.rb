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
