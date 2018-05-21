require 'rails_helper'

RSpec.feature "Deleting an Article", type: :feature do
  before do
    @user = User.create(email: 'user@example.com', password: 'secret')
    login_as @user
    @article = Article.create(
      title: 'The first article',
      body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      user: @user
    )
  end

  scenario "A user deletes an article" do
    visit root_path

    click_link @article.title
    click_link 'Delete Article'

    expect(page).to have_content 'Article has been deleted'
    expect(current_path).to eq(articles_path)
  end
end
