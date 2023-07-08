# Helper methods for the Application views and controllers
module ApplicationHelper
  def button_active_class
    session[:button_active] ? 'active' : ''
  end
end
