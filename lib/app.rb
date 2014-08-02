require 'sinatra'

class CMS < Sinatra::Base

  set :method_override, true
  set :root, 'lib/app'

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    erb :error
  end

  get '/pages/:id' do |id|
    "Here's the page with ID #{id}"
  end
end
