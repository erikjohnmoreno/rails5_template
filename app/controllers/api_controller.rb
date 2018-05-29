class ApiController < ActionController::Base
  include CommonActions
  include CommonResponse
  include ApiExceptions
end
