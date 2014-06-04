module SSHer
  class Officer
    attr_reader :command
  
    def initialize(command, callback)
      @command = command
      @callback = callback
    end
  
    def call(data)
      @output = @callback.call(data)
    end
  
    def report
      @output
    end
  
  end 
end 