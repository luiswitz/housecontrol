class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authentication_user!
end
