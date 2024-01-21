require 'net/http'
require 'uri'
require 'json'

class CaptchaController < ApplicationController
  def verifyCaptcha(captcha_response)

    return false if captcha_response.nil? || captcha_response.empty?

    # Rails.logger.info("Captcha token: #{captcha_response}")
    # Rails.logger.info("Captcha secret: #{ENV['CAPTCHA_SECRET_KEY']}")
  
    uri = URI.parse("https://challenges.cloudflare.com/turnstile/v0/siteverify")
    request = Net::HTTP::Post.new(uri)
    request.set_form_data(
      "secret" => ENV['CAPTCHA_SECRET_KEY'],
      "response" => captcha_response,
    )

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    data = JSON.parse(response.body)

    # Rails.logger.info("Captcha response: #{data}")

    return data['success']
  end

  def setSessionCaptcha
    session[:captcha_response] = params[:token]
    head :ok
  end
end