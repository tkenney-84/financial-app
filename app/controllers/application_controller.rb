class ApplicationController < ActionController::Base
    before_action :authenticate_user!, unless: -> { devise_controller? || captcha_storage_request? }
    before_action :verify_captcha, unless: -> { user_signed_in? || captcha_storage_request? }
  
    def after_sign_in_path_for(resource)
      # return the path based on resource
      dashboard_path
    end
  
    private
  
    def verify_captcha
        CaptchaController.new.verifyCaptcha(session[:captcha_response])
    end

    def captcha_storage_request?
      request.path == '/set_session_captcha' && request.post?
    end
  end