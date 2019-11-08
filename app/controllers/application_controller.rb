class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: ENV["HTTP_AUTH_USERNAME"], password: ENV["HTTP_AUTH_PASSWORD"]
end
