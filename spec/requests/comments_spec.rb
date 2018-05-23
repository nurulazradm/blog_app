require 'rails_helper'

RSpec.describe "Comments", type: :request do

  before do
    @user = User.create(email: 'user@example.com', password: 'secret')
    @friend = User.create(email: 'friend@example.com', password: 'secret')
    @article = Article.create!(
      title: 'Title One',
      body: 'Body of article title one',
      user: @user
    )
  end

  describe "POST /articles/:id/comments" do
    context "with a non-signed in user" do
      before do
        post "/articles/#{@article.id}/comments", params: { comment: { body: 'Awesome blog' } }
      end

      it "redirects user to the signin page" do
        flash_message = 'Please sign in or sign up first'
        expect(response).to redirect_to(new_user_session_path)
        expect(response).to have_http_status 302
        expect(flash[:alert]).to eq flash_message
      end
    end

    context "with a signed in user" do
      before do
        login_as @friend
        post "/articles/#{@article.id}/comments", params: { comment: { body: 'Awesome blog' } }
      end

      it "create the comment successfully" do
        flash_message = "Comment has been created"
        # expect(response).to redirect_to article_comments_path(@article.id)
        expect(response).to have_http_status 200
        expect(flash[:notice]).to eq flash_message
      end
    end
  end
end
