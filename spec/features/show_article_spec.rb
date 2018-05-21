require 'rails_helper'

RSpec.feature "Showing an article", type: :feature do
  before do
    @article = Article.create(title: 'The first article', body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
  end

  scenario "A user shows an article" do
    visit root_path

    click_link @article.title

    expect(page).to have_content @article.title
    expect(page).to have_content @article.body
    expect(current_path).to eq(article_path(@article))
  end
end
