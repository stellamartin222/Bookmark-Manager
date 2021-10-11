require 'sinatra'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
    get '/' do
        erb(:index)
    end

    get '/bookmarks' do
        @bookmarks = Bookmark.all
        erb(:bookmarks)
    end
end
