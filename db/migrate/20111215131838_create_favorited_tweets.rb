class CreateFavoritedTweets < ActiveRecord::Migration
  def change
    create_table :favorited_tweets do |t|
      t.string :tweet_id
      t.string :user_name
      t.string :user_screen_name
      t.string :user_url
      t.string :user_photo
      t.text :body
      t.datetime :created_at
    end
  end
end
