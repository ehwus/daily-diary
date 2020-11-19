require 'capybara/rspec'

feature "View diary" do
  scenario "displays an empty diary" do
    visit('/diary')
    expect(page).to have_content("My Daily Diary")
  end

  scenario "displays a non-empty diary" do
    Diary.create(title: "Foo", body: "Bar")
    visit('/diary')
    expect(page).to have_content("Foo")
  end
end