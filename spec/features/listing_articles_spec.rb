require 'rails_helper'

RSpec.feature "Listing articles", type: :feature do
  before do
    @article1 = Article.create(title: 'The first article', body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
    @article2 = Article.create(title: 'The second article', body: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.')
  end

  scenario "A user lists all articles" do
    visit root_path

    expect(page).to have_content @article1.title
    expect(page).to have_content @article1.body
    expect(page).to have_content @article2.title
    expect(page).to have_content @article2.body
    expect(page).to have_link @article1.title
    expect(page).to have_link @article2.title
  end

  scenario "A user has no articles" do
    Article.delete_all

    visit root_path

    expect(page).not_to have_content @article1.title
    expect(page).not_to have_content @article1.body
    expect(page).not_to have_content @article2.title
    expect(page).not_to have_content @article2.body
    expect(page).not_to have_link @article1.title
    expect(page).not_to have_link @article2.title

    within('h1#no-articles') do
      expect(page).to have_content 'No articles created'
    end
  end
end
