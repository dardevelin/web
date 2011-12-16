$ ->
  $("#favorited_tweets").
    scrollable(
      circular: true
    ).autoscroll(
      autoplay: true
      interval: 10000
    ).navigator(
      navi: '.tweet_navi'
    )

  $(".tweet_navi a:first").addClass 'active'
