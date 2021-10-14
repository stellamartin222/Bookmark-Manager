require 'sinatra'
require 'sinatra/flash'
require './lib/bookmark'
require './lib/database_connection_setup'

class BookmarkManager < Sinatra::Base
    enable :sessions
    register Sinatra::Flash

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
        if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
            Bookmark.create(params['url'], params[:title])
            redirect('/bookmarks')
        else
            flash[:notice] = "You must submit a valid URL."
            redirect('/create-bookmark')
        end
    end

    post '/bookmarks/delete/:id' do
        @bookmark = Bookmark.delete(params[:id])
        redirect('/bookmarks')
    end

    get '/bookmarks/update/:id' do
        @bookmark = Bookmark.find(params[:id])
        erb(:update_bookmark)
    end

    post '/:id/bookmarks/update' do
        Bookmark.find(params[:id]).update(params[:url], params[:title])
        redirect("/bookmarks")
    end
end
