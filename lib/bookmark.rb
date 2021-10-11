class Bookmark 

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def self.all
    [Bookmark.new('www.youtube.com'), Bookmark.new('www.google.com')]
  end
end