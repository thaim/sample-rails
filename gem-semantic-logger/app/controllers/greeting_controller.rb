class GreetingController < ApplicationController
  def index
    logger.debug "greeting index"

    Rails.logger.info "hello message"
  end
end
