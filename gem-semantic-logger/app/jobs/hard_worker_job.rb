class HardWorkerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    logger.info "performing hard work job"

    p "performing!"
  end
end
