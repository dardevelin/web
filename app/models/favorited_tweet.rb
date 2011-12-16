class FavoritedTweet < ActiveRecord::Base
  validates :body, :user_name, :user_screen_name, :created_at, presence: true

  def url
    "http://twitter.com/#{user_screen_name}/status/#{tweet_id}"
  end
end
