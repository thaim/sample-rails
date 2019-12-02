# This file is used by Rack-based servers to start the application.

require 'unicorn/worker_killer'
use Unicorn::WorkerKiller::Oom, 64*(1024**2), 512*(1024**2), 16, true

require_relative 'config/environment'

run Rails.application
