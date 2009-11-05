require 'rturk'

class AE
  def initialize(app, args = {})
    @app = app
    id = args.delete(:aws_access_key_id)
    key = args.delete(:aws_access_key)
    
    RTurk.setup(id, key, args)
  end
  
  def call(env)
    status, headers, response = @app.call(env)
    
    if env.has_key?("rack.request.query_hash") &&  env["rack.request.query_hash"].has_key?("accessible")
      phone_number = env["rack.request.query_hash"]["accessible"]
      url = env["REQUEST_URI"]
      
      deliver_job(phone_number, url) if phone_number =~ /\d+/
    end
    
    
    [status, headers, response]
  end
  
  private
  
  def deliver_job(phone_number, url)
    RTurk::Hit.create(:title => "Call this phone number") do |hit|
      hit.assignments = 2
      hit.description = "Call #{phone_number} on the telephone and explain the the graphics on the screen to them"
      hit.question(url)
      hit.reward = 0.05
      hit.qualifications.add :approval_rate, { :gt => 80 }
    end
  end
end