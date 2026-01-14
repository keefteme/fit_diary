class ApplicationController < ActionController::Base
  # Требовать вход для ЛЮБОГО действия
  before_action :authenticate_user!
  
  allow_browser versions: :modern
end
