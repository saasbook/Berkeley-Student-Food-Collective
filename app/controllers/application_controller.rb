class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def addE(action)
    if (action[-1] != "e")
      action += "e"
    end
    action
  end
end
