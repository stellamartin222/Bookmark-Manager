require 'pg'

def test_db_inserts
    connection = PG.connect(dbname: 'bookmark_manager_test')
      # Add test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
end

def drop_test_db
    p "Setting up test database..."
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Clear the bookmarks table
    connection.exec("TRUNCATE bookmarks;")
end