require 'bookmark'

describe Bookmark do
  describe "#initialize" do
    it 'can be passed the url' do
      bookmark = Bookmark.new('www.youtube.com')
      expect(bookmark.url).to eq 'www.youtube.com'
    end
  end

  describe '#all' do
    it 'returns a hard coded array of instances' do
      bookmarks = Bookmark.all
      expect(bookmarks[0].url).to eq 'www.youtube.com'
      expect(bookmarks[1].url).to eq 'www.google.com'
    end
  end
end
