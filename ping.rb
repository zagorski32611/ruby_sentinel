class Ping
    require './super_secret_passwords.rb'
    require './text_messages.rb'
    
    def self.execute_ping
        begin
           command = system "ping -c 2 #{Secrets.test_host}"
           puts "Successfully pinged host"
        rescue
            puts "unable to connect!"
            TextMessages.send_text("Unable to ping host!")
        end
    end
end

Ping.execute_ping

