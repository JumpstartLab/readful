class ApplicationController < ActionController::Base
  protect_from_forgery
  helper AuthensiveClient::Engine.helpers
end
