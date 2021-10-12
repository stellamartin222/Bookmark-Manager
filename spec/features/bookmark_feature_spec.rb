feature 'Has a index page' do
  scenario 'Displays the webpage title' do
    visit('/')
    expect(page).to have_content 'Bookmarks'
  end
end

feature 'Displays bookmarks' do
  scenario 'Able to display a number of bookmarks' do
    test_db_inserts

    visit('/bookmarks')
    expect(page).to have_content 'http://www.makersacademy.com/'
  end
end
