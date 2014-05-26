require 'net/ssh'
module Ssher
  class Connection

    def initialize(options={})
  	  @host = options.fetch(:host)
  	  @user = options.fetch(:user)
  	end

  	def connect(password)
  	  Net::SSH.start(@host, @user, password: password) do |ssh|
  	  	output = ssh.exec!('hostname')
  	  end
  	end
  end
end
=begin
Net::SSH.start('host', 'user', :password => "password") do |ssh|
  # capture all stderr and stdout output from a remote process
  output = ssh.exec!("hostname")

  # capture only stdout matching a particular pattern
  stdout = ""
  ssh.exec!("ls -l /home/jamis") do |channel, stream, data|
    stdout << data if stream == :stdout
  end
  puts stdout

  # run multiple processes in parallel to completion
  ssh.exec "sed ..."
  ssh.exec "awk ..."
  ssh.exec "rm -rf ..."
  ssh.loop

  # open a new channel and configure a minimal set of callbacks, then run
  # the event loop until the channel finishes (closes)
  channel = ssh.open_channel do |ch|
    ch.exec "/usr/local/bin/ruby /path/to/file.rb" do |ch, success|
      raise "could not execute command" unless success

      # "on_data" is called when the process writes something to stdout
      ch.on_data do |c, data|
        $stdout.print data
      end

      # "on_extended_data" is called when the process writes something to stderr
      ch.on_extended_data do |c, type, data|
        $stderr.print data
      end

      ch.on_close { puts "done!" }
    end
  end

  channel.wait

  # forward connections on local port 1234 to port 80 of www.capify.org
  ssh.forward.local(1234, "www.capify.org", 80)
  ssh.loop { true }
end
=end