require 'bookmark'

describe Bookmark do
  describe "#initialize" do
    it 'can be passed the url' do
      bookmark = Bookmark.new('www.youtube.com')
      expect(bookmark.url).to eq 'www.youtube.com'
    end
  end

  describe '#all' do
    it 'returns from bookmarks sql table' do
      bookmarks = Bookmark.all
      expect(bookmarks[0]).to eq 'http://www.makersacademy.com/'
      expect(bookmarks[1]).to eq 'http://www.google.com/'
      expect(bookmarks[2]).to eq 'http://www.destroyallsoftware.com'
      expect(bookmarks[3]).to eq 'http://www.facebook.com/'
    end
  end
end
