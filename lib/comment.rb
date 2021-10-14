require 'pg'

class Comment
  def self.create(text, bookmark_id)
    DatabaseConnection.query("INSERT INTO comments(text, bookmark_id) VALUES ($1, $2);", [text, bookmark_id])
  end
end