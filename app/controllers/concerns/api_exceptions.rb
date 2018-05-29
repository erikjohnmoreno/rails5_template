module ApiExceptions
  extend ActiveSupport::Concern

  included do
    class InvalidCredentialsError < StandardError; end
    rescue_from InvalidCredentialsError do
      render json: { error: "Your email and password don't match" }, status: :unauthorized
    end

    class UserInactiveError < StandardError; end
    rescue_from UserInactiveError do
      render json: {error: 'User is inactive.'}, status: :unauthorized
    end

    class InvalidNoException < StandardError; end
    rescue_from InvalidNoException do
      render json: {error: "Invalid mobile number. Your number doesn't exist in our system."}, status: 422
    end

    class InvalidMobileException < StandardError; end
    rescue_from InvalidMobileException do
      render json: {error: "Mobile Number already exist in our system."}, status: 422
    end

    class UserBannedError < StandardError; end
    rescue_from UserBannedError do
      render json: {error: 'User is locked, please contact your administrator to reset your account'}, status: :unauthorized
    end
    #
    # raise an error if:
    # the token is an invalid token
    # either it is an old token
    # or simple the token does not exist
    #
    class ExpiredSessionError < StandardError; end
    rescue_from ExpiredSessionError do
      render json: { error: 'Your session has expired' }, status: :unauthorized # unofficial expired session
    end

    class ExpiredApprovalSessionError < StandardError; end
    rescue_from ExpiredApprovalSessionError do
      render json: { error: 'This approval has already been submitted.' }, status: :unauthorized # unofficial expired session
    end

    #
    # raises if the auth token is missing
    #
    class UnauthorizedAccessError < StandardError; end
    rescue_from UnauthorizedAccessError do
      render json: { error: 'Access Denied' }, status: 403
    end

    #
    # raise if the user is inactive
    #
    class InvalidTokenError < StandardError; end
    rescue_from InvalidTokenError do
      render json: { error: 'Token is invalid' }, status: :unauthorized # unofficial expired session
    end

    #
    # raise if a process is halted
    #
    class ServiceError < StandardError; end
    rescue_from ServiceError do
      render json: {errors: @service.errors}, status: 422
    end

    #
    # Invalid Request
    #
    class InvalidRequestError < StandardError; end
    rescue_from InvalidRequestError do
      render json: {error: "Request is invalid"}, status: 422
    end


    class InvalidLogin < StandardError; end
    rescue_from InvalidLogin do
      render json: {error: "Incorrect user/email or password"}, status: :unauthorized
    end

    class InvalidEmail < StandardError; end
    rescue_from InvalidEmail do
      render json: {error: "Email does not exist"}, status: :unauthorized
    end

    #
    # custom http error code
    #
    class ExpiredPasswordError < StandardError; end
    rescue_from ExpiredPasswordError do
      render json: {error: "You need to renew your password"}, status: 411
    end


    class ResourceError < StandardError; end
    rescue_from ResourceError do
      render json: { errors: @obj.errors.full_messages }, status: 422
    end

    class JacekError < StandardError; end
    rescue_from JacekError do
    end



  end
end
