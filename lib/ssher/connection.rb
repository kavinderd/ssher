require 'net/ssh'
require 'net/ssh/shell'
module SSHer
  class Connection

    def initialize(options={})
  	  @host = options.fetch(:host)
  	  @user = options.fetch(:user)
  	end

  	def connect(password, officers=[])
  	  Net::SSH.start(@host, @user, password: password) do |ssh|
        officers.each do |officer|
          officer.call(ssh.exec!(officer.command))
          ssh.exec! "exit"
        end
  	  end
  	end
    
  end
end