require 'bookmark'

describe Bookmark do
  describe "#initialize" do
    it 'can be passed the url' do
      bookmark = Bookmark.new('www.youtube.com')
      expect(bookmark.url).to eq 'www.youtube.com'
    end
  end
end
