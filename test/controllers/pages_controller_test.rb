require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should show homepage" do
    get root_path
    assert_equal 'p', /Willkommen/
  end
end
