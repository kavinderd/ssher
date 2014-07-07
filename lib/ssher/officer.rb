module SSHer
  class Officer
    attr_reader :command
  
    def initialize(command, *callbacks)
      @command = command
      @callbacks = callbacks
    end
  
    def call(data)
      #@output = @callback.call(data)
      @output = @callbacks.inject([]) do |output, callback|
        callback.call(data)
      end
    end
  
    def report
      @output
    end
  
  end 
end 