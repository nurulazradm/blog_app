require 'rails_helper'

RSpec.feature "Creating articles", type: :feature do
  scenario "A user create a new article" do
    visit root_path

    click_link "New Article"
    fill_in "Title", with: "Creating a blog"
    fill_in "Body", with: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    click_button "Create Article"

    expect(page).to have_content "Article has been created"
    expect(page.current_path).to eq(articles_path)
  end
end
