require 'pg'

class Bookmark 

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def self.all
    con = PG.connect :dbname => 'bookmark_manager'
    rs = con.exec "SELECT * FROM bookmarks"
    arr = rs.map{|value| 
      value['url']
    }
    return arr
  end
end
