require 'sinatra'
require './lib/app/models/page'

class CMS < Sinatra::Base

  set :method_override, true
  set :root, 'lib/app'

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    erb :error
  end

  get '/pages/:slug' do |slug|
    if slug == 'sample_2'
      protected!
    end

    page = Page.find_by_slug(slug)
    erb :page, :locals => {:page => page}
  end

  def protected!
    return if authorized?
    headers['WWW-Authenticate'] = 'Basic realm="Jimmy\'s BBQ"'
    halt 401, "Not authorized\n"
  end

  def authorized?
    @auth ||= Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? &&
    @auth.credentials && @auth.credentials == ['admin', 'admin']
  end
end
