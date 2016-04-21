require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'Invalid signup information' do 
	  assert_no_difference 'User.count' do
	  	post users_path, user: {
	  		name:'',
	  		email:'something@example',
	  		email_confirmation:'something@example',
	  		password:'foobarbar',
	  		password_confrimation:'foobarbar'} 
	  end
	  assert_template 'users/new'
	end
  test "Valid submission" do 
  	assert_difference 'User.count', 1 do 
  		post_via_redirect users_path, user:{
  			name: 'Ahmed Samir Abdelmawgood',
  			email:'somexample@you.com',
  			email_confirmation:'somexample@you.com',
  			password:'enterPassword',
  			password_confrimation:'enterPassword'
  		}
  	end
  	assert is_logged_in?
  	assert_template 'users/show'
  end
end
