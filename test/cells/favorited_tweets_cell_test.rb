require 'test_helper'

class FavoritedTweetsCellTest < Cell::TestCase
  test "list" do
    invoke :list
    assert_select "p"
  end
  

end
