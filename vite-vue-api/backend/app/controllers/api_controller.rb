class ApiController < ApplicationController
  def index
    render json: {message: 'Hello World from Rails'}, status: 200
  end
end
