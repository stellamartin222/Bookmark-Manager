require 'pg'

class Bookmark 

  attr_reader :url, :title, :id

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      # :nocov:
      connection = PG.connect :dbname => 'bookmark_manager'  
      # :nocov:
    end
    
    result = connection.exec "SELECT * FROM bookmarks"
    result.map{ |value| Bookmark.new(value['id'], value['url'], value['title']) }
  end

  def self.create(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      # :nocov:
      connection = PG.connect :dbname => 'bookmark_manager'
      # :nocov:
    end
    
    result = connection.exec_params("INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title])
    Bookmark.new(result[0]['id'], result[0]['url'], result[0]['title'])
  end
end
