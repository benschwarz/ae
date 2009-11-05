require 'app'
require 'sinatra'

use AE, :aws_access_key_id => "abc", :aws_access_key => "123", :sandbox => true

run Sinatra::Application

get '/page' do
  "abc"
end