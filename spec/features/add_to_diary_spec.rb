require 'capybara/rspec'

feature "Add to diary" do
  scenario "it displays the neccessary elements to add" do
    visit('/diary')
    expect(page).to have_button('Submit')
    expect(page).to have_field('Body')
    expect(page).to have_field('Title')
  end

  scenario "it displays the title of the diary after adding" do
    visit('/diary')
    fill_in('Title', with: "Test title")
    fill_in('Body', with: "Test body")
    click_button('Submit')
    expect(page).to have_content('Test title')
  end
end