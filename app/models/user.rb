class User < ApplicationRecord

  PASSWORD_REQUIREMENTS = {
    minimum_capital_letters:    1,
    minimum_lower_case_letters: 1,
    minimum_numbers:            1,
    minimum_special_characters: 1,
    valid_special_characters:   "!@#\$%\^&\*"
  }.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, password_complexity: true

end
