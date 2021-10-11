require 'sinatra'

class BookmarkManager < Sinatra::Base
    get '/' do
        erb(:index)
    end

    get '/bookmarks' do
        erb(:bookmarks)
    end
end
