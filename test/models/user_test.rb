require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = User.new(name: "Happy", email: 'happy@always.com')
  end
	
	test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
  	@user.name = " "
    assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = " "
    assert_not @user.valid?
  end

  test "email should be unique and case insensitive" do
  	duplicate_user = @user.dup
  	duplicate_user.email = @user.email.upcase
  	@user.save
    assert_not duplicate_user.valid?
  end

  
end
