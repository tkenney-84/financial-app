module DeviseCustom
  class RegistrationsController < Devise::RegistrationsController
    def build_resource(*args)
      super
      @minimum_password_length = Devise.password_length.min
      @maximum_password_length = Devise.password_length.max
      # All other requirements are specified in app\validators\password_complexity_validator.rb
    end
  end
end