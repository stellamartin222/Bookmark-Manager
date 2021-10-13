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

    get '/create-bookmark' do
        erb(:create_bookmark)
    end

    post '/new-bookmark' do
        Bookmark.create(params[:url], params[:title])
        redirect('/bookmarks')
    end

    post '/bookmarks/:id' do
        @bookmark = Bookmark.delete(params[:id])
        redirect('/bookmarks')
    end
end
