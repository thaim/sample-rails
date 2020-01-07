require 'lograge/sql/extension'

Rails.application.configure do
  config.lograge.enabled = true

  config.lograge.formatter = Class.new do |fmt|
    def fmt.call(data)
      data
    end
  end
  # config.lograge.keep_original_rails_log = true
  # config.lograge.logger = ActiveSupport::Logger.new "#{Rails.root}/log/lograge_#{Rails.env}.log"
  # config.logger = MyLog::Logger.new(Rails.root.join('log', "dev_ougai.log"))

  config.lograge.custom_options = lambda do |event|
    data = {
      time: Time.now,
      ip: event.payload[:ip],
      host: event.payload[:host],
      referer: event.payload[:referer],
      user_agent: event.payload[:user_agent],
      login_id: event.payload[:login_id],
    }
    if event.payload[:exception]
      data[:exception] = event.payload[:exception],
      data[:exception_object] = event.payload[:exception_object],
      data[:exception_backtrace] = event.payload[:exception_object].backtrace[0..6]

    end

    data
  end
end
