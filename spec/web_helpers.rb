require 'pg'

def test_db_inserts
    connection = PG.connect(dbname: 'bookmark_manager_test')
      # Add test data
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com/', 'makers');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com/', 'google');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.destroyallsoftware.com', 'destroy all software');")
end

def drop_test_db
    p "Setting up test database..."
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Clear the bookmarks table
    connection.exec("TRUNCATE bookmarks;")
    connection.exec("TRUNCATE comments;")
end