class ErrorController < ApplicationController
  def index
    raise StandardError
  end
end
