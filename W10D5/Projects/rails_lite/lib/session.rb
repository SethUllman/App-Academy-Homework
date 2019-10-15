require 'json'
require 'byebug'
class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    if req.cookies["_rails_lite_app"]
      @req = JSON.parse(req.cookies["_rails_lite_app"])
    else
      @req = {}
    end
    # debugger
  end

  #Rack::Request#cookies
  #returns a hash where keys => cookie_names and values => cookie_values

  def [](key)
    # debugger
    @req[key]
  end

  def []=(key, val)
    @req[key] = val
    
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    # debugger
      res.set_cookie("_rails_lite_app", {path: "/", value: JSON.unparse(@req)})
      # debugger
  end
end
