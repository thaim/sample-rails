namespace :batch do
  task say_hello: :environment do
    Rails.logger.info "logging hello from rake task"
    puts "puts hello from rake task"
  end
end
