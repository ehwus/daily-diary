require 'capybara/rspec'

feature 'Delete' do
  scenario 'it removes a diary entry and sends back to main page' do
    visit('/diary')
    fill_in('Title', with: "Test title")
    fill_in('Body', with: "Test body")
    click_button('Submit')
    click_link('Test title')
    click_button('Delete')
    expect(current_path).to eq('/diary')
    expect(page).not_to have_content('Test title')
  end
end