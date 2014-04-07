require 'open3'
require 'ostruct'

module KnitrRuby
  class Knitr < OpenStruct

    def knit(content)
      dir = File.expand_path File.dirname(__FILE__)
      command = "./knitrscript.R --args #{options}"
      Open3::popen3(command, chdir: dir) do |stdin, stdout, stderr, wait_thr|
        stdin.puts content
        stdin.close

        raise StandardError, "Error knitting: #{stderr.read}" if wait_thr.value.exitstatus > 0
        content = stdout.read
      end
    end

    def options
      opts = chunk_options || {}
      opts.map {|k,v| "#{k}=#{v}" }.join(" ")
    end

  end
end