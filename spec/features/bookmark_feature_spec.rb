feature 'Has a index page' do
  scenario 'Displays the webpage title' do
    visit('/')
    expect(page).to have_content 'Bookmarks'
  end
end

feature 'Displays bookmarks' do
  scenario 'Able to display a number of bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content 'www.youtube.com'
    expect(page).to have_content 'www.google.com'
  end
end
