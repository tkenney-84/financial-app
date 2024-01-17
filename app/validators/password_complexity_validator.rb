# app/validators/password_complexity_validator.rb
class PasswordComplexityValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      requirements = User::PASSWORD_REQUIREMENTS
  
      regex = Regexp.new(
        "(?=(.*[A-Z]){#{requirements[:minimum_capital_letters]},})" +
        "(?=(.*[a-z]){#{requirements[:minimum_lower_case_letters]},})" +
        "(?=(.*[0-9]){#{requirements[:minimum_numbers]},})" +
        "(?=(.*[#{requirements[:valid_special_characters]}]){#{requirements[:minimum_special_characters]},})"
      )
  
      unless value =~ regex
        record.errors[attribute] << (options[:message] || 'must include at least one uppercase letter, one lowercase letter, one digit, and one special character')
      end
    end
  end