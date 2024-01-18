module Users
  class RegistrationsController < Devise::RegistrationsController
    def build_resource(*args)
      super
      @minimum_password_length = Devise.password_length.min
      @maximum_password_length = Devise.password_length.max
    end
  end
end