class Sentinel
    require 'rubygems'
    require 'net/ssh'
    require './text_messages.rb'
    require './super_secret_passwords.rb'

    def initialize(hostname, user, password, command)
        @hostname = hostname
        @user = user
        @password = password
        @command = command
    end

    def connect_and_execute
        begin
            puts "trying to connect to #{@hostname}"
            ssh = Net::SSH.start(@hostname, @user, :password => @password)
            res = ssh.exec!(@command)
            ssh.close
            @@stdout = res.to_s
        rescue 
            "Unable to Connect!"
        end
    end

    def self.parse_stdout
        data_long = @@stdout.split("\n")
        data_rows = data_long.drop(1)
        data_one = data_rows.map { |data_rows| data_rows.split(' ') }
        @data = []
        for drive in data_one
            drive[4].gsub!(/[!@%&"]/,'')
            @data << drive
        end
    end

    def self.analyze_drive(threshold)
        @full_drives = []
        for drive in @data
            if Integer(drive[4]) > threshold
                @full_drives << drive
            end
        end
    end

   def self.send_text
        if @full_drives.length == 1
             TextMessages.send_text("WARNING! #{@full_drives} is over capacity!")
        elsif @full_drives.length > 1
            TextMessages.send_text("WARNING! The following drives are over capacity: #{@full_drives}")
        else
            print  "Nothing to see here!"
         end
    end    
end

Sentinel.new(Secrets.host, Secrets.user, Secrets.password, "df -h").connect_and_execute
Sentinel.parse_stdout
Sentinel.analyze_drive(0)
Sentinel.send_text