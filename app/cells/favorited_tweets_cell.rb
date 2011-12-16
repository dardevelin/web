class FavoritedTweetsCell < Cell::Rails

  def list(max = nil)
    @tweets = FavoritedTweet.order('created_at desc')
    @tweets = @tweets.limit(max) if max
    render
  end

end
