require 'pg'

class Bookmark 

  attr_reader :url

  def initialize(url)
    @url = url
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
    result.map{ |value| value['url'] }
  end

  def self.create(url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      # :nocov:
      connection = PG.connect :dbname => 'bookmark_manager'
      # :nocov:
    end
    
    connection.exec "INSERT INTO bookmarks(url) VALUES('#{url}');"
  end
end
