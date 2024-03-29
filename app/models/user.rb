class User < ApplicationRecord

  PASSWORD_REQUIREMENTS = {
    minimum_capital_letters:    1,
    minimum_lower_case_letters: 1,
    minimum_numbers:            1,
    minimum_special_characters: 1,
    valid_special_characters:   "!@#\$%\^&\*"
  }.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable

  validates :password, password_complexity: true
  validates :email, email_format: true

end
