require 'sinatra'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
    enable :sessions

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

    post '/bookmarks/delete/:id' do
        @bookmark = Bookmark.delete(params[:id])
        redirect('/bookmarks')
    end

    get '/bookmarks/update/:id' do
        @bookmark = Bookmark.find(params[:id])
        session[:id] = @bookmark.id
        erb(:update_bookmark)
    end

    post '/bookmarks/update/:title/:url' do
        @bookmark = Bookmark.find(session[:id])
        @bookmark.update(params[:url], params[:title])
        redirect("/bookmarks")
    end
end
