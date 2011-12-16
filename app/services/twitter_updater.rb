module TwitterUpdater
  def self.update_favorited_tweets(user)
    Twitter.favorites(user).each do |tweet|
      FavoritedTweet.find_or_create_by_tweet_id(
        tweet.id.to_s,
        tweet_id: tweet.id.to_s,
        body: tweet.text,
        created_at: tweet.created_at,
        user_name: tweet.user.name,
        user_screen_name: tweet.user.screen_name,
        user_url: tweet.user.url,
        user_photo: tweet.user.profile_image_url
      )
    end
  end
end
