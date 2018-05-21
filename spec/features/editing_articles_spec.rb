require 'rails_helper'

RSpec.feature "EditingArticles", type: :feature do

  before do
    @article = Article.create(title: 'The first article', body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
  end

  scenario "A user updates an article" do
    visit root_path

    click_link @article.title
    click_link "Edit Article"

    fill_in 'Title', with: 'Updated first article'
    fill_in 'Body', with: 'Updated first article body'
    click_button 'Update Article'

    expect(page).to have_content 'Article has been updated'
    expect(current_path).to eq(article_path(@article))
  end

  scenario "A user fails to update an article" do
    visit root_path

    click_link @article.title
    click_link "Edit Article"

    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Updated first article body'
    click_button 'Update Article'

    expect(page).to have_content 'Article has not been updated'
    expect(current_path).to eq(article_path(@article))
  end

end
