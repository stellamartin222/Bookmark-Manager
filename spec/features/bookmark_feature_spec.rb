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
    expect(page).to have_content 'makers'
  end
end

feature 'Adds bookmarks' do
  scenario 'Able to add a new bookmark to the list of bookmarks' do
    visit('/create-bookmark')
    page.fill_in('url', with: 'http://www.facebook.com/')
    page.fill_in('title', with: 'facebook')
    page.click_button('Submit')
    expect(page).to have_current_path('/bookmarks')
    expect(page).to have_content('facebook')
  end
end

feature 'Deletes bookmarks' do
  scenario 'Able to delete a bookmark from the list of bookmarks' do
    test_db_inserts
    visit('/bookmarks')
    within("section[@id='0']") do
      click_button('delete')
    end
  
    expect(page).to have_current_path('/bookmarks')
    expect(page).to_not have_content('makers')
  end
end