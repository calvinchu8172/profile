module Services
  module RakeLogger

    # This log method is using Rails logger
    def self.rails_log

      log_file = File.new("log/cron.log", "a")
      Rails.logger = Logger.new(MultiIO.new(STDOUT, log_file)) #Multi-output to stdout and log file
      rake_log = Rails.logger


      rake_log.formatter = proc do |severity, datetime, progname, msg|
        "[#{severity}] #{datetime.strftime('%Y/%m/%d %H:%M:%S:%L %Z')} :: #{msg}\n"
      end

      rake_log.level = Logger::DEBUG

      return rake_log
    end

  end

end

class MultiIO
  def initialize(*targets)
    @targets = targets
  end

  def write(*args)
    @targets.each {|t| t.write(*args)}
  end

  def close
    @targets.each(&:close)
  end
end


