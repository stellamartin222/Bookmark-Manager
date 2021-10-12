require 'pg'

class Bookmark 

  attr_reader :url, :title

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
    
    connection.exec "INSERT INTO bookmarks(url, title) VALUES('#{url}', '#{title}');"
  end
end
