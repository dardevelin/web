desc 'Updates codegram favorite tweets'
task update_favorited_tweets: :environment do
  TwitterUpdater.update_favorited_tweets('codegram')
end
