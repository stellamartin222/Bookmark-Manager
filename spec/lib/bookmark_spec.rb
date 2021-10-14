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

    it 'does not create a new bookmark if the URL is not valid' do
      Bookmark.create('not a real bookmark', 'not a real bookmark')
      expect(Bookmark.all).to be_empty
    end
  end

  describe "#delete" do
    it 'deletes a bookmark when passed the id' do
      bookmark = Bookmark.create('http://www.facebook.com/', 'facebook')
      data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks;")
      expect(data.first["title"]).to eq 'facebook'
  
      Bookmark.delete(bookmark.id)

      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks;")

      expect(persisted_data.first.nil?).to eq true
    end
  end

  describe "#update" do
    it 'updates a bookmark when passed the id' do
      Bookmark.create('http://www.facebook.com/', 'facebook')
      data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks;")

      bookmark_id = data.first['id']

      bookmark = Bookmark.find(bookmark_id)
      bookmark.update("www.twitter.com", "twitter")

      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks;")
      result = persisted_data.first

      expect(result['title']).to eq 'twitter'
      expect(result['url']).to eq 'www.twitter.com'
    end
  end

  describe "#find" do
    it 'returns a bookmark object when passed the id' do
      Bookmark.create('http://www.facebook.com/', 'facebook')
      data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks;")

      bookmark_id = data.first['id']
      
      bookmark = Bookmark.find(bookmark_id)
      expect(bookmark.id).to eq bookmark_id
      expect(bookmark.title).to eq 'facebook'
      expect(bookmark.url).to eq 'http://www.facebook.com/'
    end
  end
end
