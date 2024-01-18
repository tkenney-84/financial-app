class Rack::Attack
    # Throttle all requests by IP (60 requests per minute)
    throttle('req/ip', limit: 60, period: 1.minute) do |req|
      req.ip
    end
  
    # Throttle login attempts by IP address
    throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
      if req.path == '/users/sign_in' && req.post?
        req.ip
      end
    end
  
    # Throttle setSessionCaptcha by IP address
    throttle('setSessionCaptcha/ip', limit: 60, period: 1.minute) do |req|
      if req.path == '/set_session_captcha' && req.post?
        req.ip
      end
    end
  end