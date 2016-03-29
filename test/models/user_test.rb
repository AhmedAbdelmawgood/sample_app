require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup 
  	@user = User.new(name:'Ahmed Samor', email:'user@example.com',
                    password:'axobardb', password_confirmation:'axobardb')
  end
  test 'password mimimum length' do 
    @user.password = 'a'*7
    @user.password_confirmation = 'a'*7
    assert_not @user.valid?
  end
  test 'password white spaces only not valid' do 
    @user.password = '         '
    @user.password_confirmation = '         '
    assert_not @user.valid?
  end
  test 'valid password' do 
    @user.password = 'someVal id password'
    @user.password_confirmation = 'someVal id password'
    assert @user.valid?
  end
  test 'unconfirmed password' do 
    @user.password = 'anotherunvalid'
    assert_not @user.valid?
  end
  test 'should be valid' do 
  	assert @user.valid?
  end
  test 'name should not valid' do 
  	@user.name = '     '
  	assert_not @user.valid?
  end
  test 'should not valid 2' do 
  	@user.name = ''
  	assert_not @user.valid?

  end
  test 'name should not be too long' do 
  	@user.name = 'a'*51
  	assert_not @user.valid?
  end
  test 'email should not be too long' do 
  	@user.email = 'a'*244 + '@example.com'
  	assert_not @user.valid?
  end
  test 'email should be valid' do 
  	valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.com first.last@example.com 
  					     alice+bob@exmaple.com]
    valid_addresses.each do |address|
    	@user.email = address 
    	assert @user.valid?, "#{address.inspect} should be valid" 
    	end
    end
    test 'email validation should reject invalid addresses' do 
    	invalid_address = %w[user@example,com user_at_foo.org user.name@example. 
    						foo@bar_bar.com foo@bar+bar.com foo@bar..example.com]
    	invalid_address.each do |address| 
    		@user.email = address 
    		assert_not @user.valid?, "#{address.inspect} should not be valid"
    	end
    end
    test 'dupilcate email should not be allowed' do 
    	duplicate = @user.dup 
    	duplicate.email = @user.email.upcase 
    	@user.save 
    	assert_not duplicate.valid?
    end

end
