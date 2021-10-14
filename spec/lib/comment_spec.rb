require 'database_connection'
require 'comment'

describe Comment do
  describe '#create' do
    it 'creates a new comment' do
      DatabaseConnection.setup('bookmark_manager_test')
      DatabaseConnection.query("INSERT INTO bookmarks(url, title) VALUES ('http://www.techradar.com/', 'Techradar');")
  
      response = DatabaseConnection.query("SELECT * FROM bookmarks;")
      bookmark_id = response.first['id']
      Comment.create('This is a comment', bookmark_id)
  
      new_response = DatabaseConnection.query("SELECT * FROM comments;")
      comment = new_response.first
      expect(comment['text']).to eq 'This is a comment'  
    end
  end
end
