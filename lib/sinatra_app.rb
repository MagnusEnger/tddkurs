require 'rubygems'
require 'sinatra/base'

class MyApp < Sinatra::Base

@@db = ["ABC", "Alle barna", "Bobseybarna"]

  def searchbooks(string)
    
    response = @@db.grep /^#{string}/i
  end

  get "/" do
    "Hello World!"
  end
  
  post "/search/:query" do
    query = params[:query]
    searchbooks(query)
  end

end
