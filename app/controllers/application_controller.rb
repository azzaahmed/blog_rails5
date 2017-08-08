class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# handle any not found exception
  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found 

  # this method would be override in the controllers as it is how we would handle the exception
protected
def resource_not_found 
end

end
