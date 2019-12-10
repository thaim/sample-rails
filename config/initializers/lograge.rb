Rails.application.configure do
  config.lograge.enabled = true

  config.lograge.keep_original_rails_log = true
  config.lograge.logger = ActiveSupport::Logger.new "#{Rails.root}/log/lograge_#{Rails.env}.log"

  config.lograge.custom_options = lambda do |event|
    {
      time: Time.now,
      host: event.payload[:host],
      exception: event.payload[:exception],
      exception_object: event.payload[:exception_object]
    }
  end
end
