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

  scenario "lets user click back into the list of diary entries" do
    Diary.create(title: "Test 1", body: "Hiya")
    Diary.create(title: "Test 2", body: "Hello")
    visit('/diary')
    click_link('Test 1')
    expect(page).not_to have_content("Test 2")
    expect(page).to have_button("Back")
    click_button("Back")
    expect(page).to have_content("Test 1")
    expect(page).to have_content("Test 2")
  end
end