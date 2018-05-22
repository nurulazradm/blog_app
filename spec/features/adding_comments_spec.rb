require 'rails_helper'

RSpec.feature "Adding comments to article", type: :feature do
  before do
    @user = User.create(email: 'user@example.com', password: 'secret')
    @friend = User.create(email: 'friend@example.com', password: 'secret')
    @article = Article.create!(
      title: 'The first article',
      body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      user: @user
    )
  end

  scenario "permits a signed in user to write a review" do
    login_as @friend
    visit root_path

    click_link @article.title
    fill_in "New Comment", with: "An amazing article"
    click_button "Add Comment"

    expect(page).to have_content "Comment has been created"
    expect(page).to have_content "An amazing article"
    expect(current_path).to eq(article_path(@article.id))
  end
end
