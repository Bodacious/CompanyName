class ApplicationController < ActionController::Base
  
  http_basic_authenticate_with :name => "Bodacious", :password => "wordpass"
  
  protect_from_forgery
end
