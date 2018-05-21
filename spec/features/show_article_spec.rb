require 'rails_helper'

RSpec.feature "Showing an article", type: :feature do
  before do
    @user = User.create(email: 'user@example.com', password: 'secret')
    @other_user = User.create(email: 'other_user@example.com', password: 'secret')
    @article = Article.create(
      title: 'The first article',
      body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      user: @user
    )
  end

  scenario "to non-signed in user hide the Edit and Delete buttons" do
    visit root_path

    click_link @article.title

    expect(page).to have_content @article.title
    expect(page).to have_content @article.body
    expect(current_path).to eq(article_path(@article))
    expect(page).not_to have_link 'Edit Article'
    expect(page).not_to have_link 'Delete Article'
  end

  scenario "to non owner hide the Edit and Delete buttons" do
    login_as @other_user
    visit root_path

    click_link @article.title

    expect(page).to have_content @article.title
    expect(page).to have_content @article.body
    expect(current_path).to eq(article_path(@article))
    expect(page).not_to have_link 'Edit Article'
    expect(page).not_to have_link 'Delete Article'
  end

  scenario "A signed in owner sees both the Edit and Delete buttons" do
    login_as @user
    visit root_path

    click_link @article.title

    expect(page).to have_content @article.title
    expect(page).to have_content @article.body
    expect(current_path).to eq(article_path(@article))
    expect(page).to have_link 'Edit Article'
    expect(page).to have_link 'Delete Article'
  end
end
