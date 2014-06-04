module SSHer

  module OutputParser
    def self.file_proc(pattern=/.iso|.ISO/)
      Proc.new {|result| result.gsub(pattern, "").split("\n") }
    end

    def self.directory_proc
      Proc.new {|result| result.gsub("\n", "").split("/") }
    end
  end

end