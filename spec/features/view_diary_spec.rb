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

  scenario "allows user to click into a main entry" do
    Diary.create(title: "Foo", body: "Bar")
    visit('/diary')
    expect(page).to have_link('Foo')
    click_link('Foo')
    expect(page).to have_content("Foo")
    expect(page).to have_content("Bar")
  end
end