# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  
  # def rescue_action_in_public(exception)      
    # logger.error("rescue_action_in_public executed")      
    # case exception      
    # when ActiveRecord::RecordNotFound, ::ActionController::RoutingError,        
      # ::ActionController::UnknownAction      
      # logger.error("404 displayed")      
      # render(:file  => "#{RAILS_ROOT}/public/404.html",      
      # :status   => "404 Not Found")      
    # else      
      # logger.error("500 displayed")      
      # render(:file  => "#{RAILS_ROOT}/public/500.html",      
      # :status   => "500 Error")      
# #      SystemNotifier.deliver_exception_notification(self, request,        
# #                                                    exception)      
    # end      
  # end 
   
end
