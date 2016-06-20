require 'test_helper'

class SearchesControllerTest < ActionController::TestCase

  test "shoul get home" do
    get(:home)
    assert_select "h3", "Please select parameters for search"
  end

  test "should find both songs by Drake" do
    get(:search, {"artist_name"=>"dr"})
    assert_select "li", 2
    assert_select "p", "Song Title"
    assert_select "p", "Song Title2"

  end

  test "should only show one song that matches song parameter" do
    get(:search, {"song_title"=>"2"})
    assert_select "li", 1
    assert_select "p", "Song Title2"
  end

  test "should not show any sogs if no match" do
    get(:search, {"album_title"=>"fdasf"})
    assert_select "li", 0
    assert_select "h3", "Sorry, no songs match those parameters"
  end
end
