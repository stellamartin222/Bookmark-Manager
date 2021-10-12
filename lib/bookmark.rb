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
      connection = PG.connect :dbname => 'bookmark_manager'  
    end
    
    result = connection.exec "SELECT * FROM bookmarks"
    result.map{ |value| value['url'] }
  end
end
