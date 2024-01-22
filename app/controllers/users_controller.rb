class UsersController < ApplicationController
    def edit
      @user = current_user
    end
  
    def update
      @user = current_user
      if @user.update(user_params)
        redirect_to edit_user_path, notice: 'Profile Updated Successfully'
      else
        render :edit
      end
    end

    def get_password_requirements
        custom_requirements = User::PASSWORD_REQUIREMENTS;
        requirements = {
            minimum: Devise.password_length.min,
            maximum: Devise.password_length.max,
            uppercase: custom_requirements[:minimum_capital_letters],
            lowercase: custom_requirements[:minimum_lower_case_letters],
            numbers: custom_requirements[:minimum_numbers],
            special_characters: custom_requirements[:minimum_special_characters],
            valid_special_characters: custom_requirements[:valid_special_characters]
        }

        render json: requirements
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end