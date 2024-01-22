# app/validators/password_complexity_validator.rb
class EmailFormatValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)

      emailIsInEmailFormat = /\S+@\S+\.\S+/.match(value)

      unless value =~ regex
        record.errors.add(attribute, options[:message] || 'email must be in the form of a valid email. i.e. example@example.com')
      end
    end
  end