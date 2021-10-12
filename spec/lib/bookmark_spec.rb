require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'returns from bookmarks sql table' do
      test_db_inserts
      bookmarks = Bookmark.all
      
      expect(bookmarks[0].url).to eq 'http://www.makersacademy.com/'
      expect(bookmarks[1].url).to eq 'http://www.google.com/'
      expect(bookmarks[2].url).to eq 'http://www.destroyallsoftware.com'
    end
  end

  describe "#create" do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create('http://www.facebook.com/', 'facebook')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'facebook'
    end
  end
end
