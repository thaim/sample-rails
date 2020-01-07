class ApplicationController < ActionController::Base
  def append_info_to_payload(payload)
    super
    payload[:ip] = request.remote_ip
    payload[:host] = request.host
    payload[:referer] = request.referer
    payload[:user_agent] = request.user_agent

    payload[:login_id] = session[:login_id]
  end
end
