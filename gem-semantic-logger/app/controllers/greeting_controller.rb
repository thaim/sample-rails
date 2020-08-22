class GreetingController < ApplicationController
  def index
    logger.debug "greeting index"
    logger.debug payload: {user: 'anonymous'}

    logger.debug('hello message with payload', user: 'thaim')

    Rails.logger.info "hello message"

    HardWorkerJob.perform_later
    logger.debug "call job performing"
  end
end
