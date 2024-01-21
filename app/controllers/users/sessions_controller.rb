module Users
    class SessionsController < Devise::SessionsController
        def create
            self.resource = warden.authenticate!(auth_options)
            if verifyCaptcha
              set_flash_message!(:notice, :signed_in)
              sign_in(resource_name, resource)
              yield resource if block_given?
              respond_with resource, location: after_sign_in_path_for(resource)
            else
              sign_out(resource_name)
              flash[:alert] = "CAPTCHA Verification Failed"
              redirect_to sign_out_path
            end
        end
    
        private
    
        def verifyCaptcha
            return CaptchaController.new.verifyCaptcha(session[:captcha_response])
        end
    end
end