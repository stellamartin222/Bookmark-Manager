feature 'Has a index page' do
  scenario 'Displays the webpage title' do
    visit('/')
    expect(page).to have_content 'Bookmarks'
  end
end

feature 'Displays bookmarks' do
  scenario 'Able to display a number of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")

    visit('/bookmarks')
    expect(page).to have_content 'http://www.makersacademy.com/'
  end
end
