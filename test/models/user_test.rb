require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'valid with valid attributes' do
    user = build(:user)
    assert user.valid?
  end

  test 'invalid without required attributes' do
    user = build(:user, first_name: nil, middle_name: nil, last_name: nil, date_of_birth: nil, email: nil, password: nil)
    assert_not user.valid?
    assert_equal [
      "First name can't be blank",
      "Last name can't be blank",
      "Date of birth can't be blank",
      "Email can't be blank",
      "Password can't be blank"
    ], user.errors.full_messages
  end

  test 'requires a password to be at least 6 characters long with letters, numbers, and symbols' do
    user = build(:user, password: 'short')
    assert_not user.valid?
    assert_equal ["Password is too short (minimum: 6 characters)"], user.errors.full_messages

    user.password = 'weakpassword'
    assert_not user.valid?
    assert_equal ["Password must include at least one letter, one number, and one symbol"], user.errors.full_messages

    user.password = 'StrongP@ss123'
    assert user.valid?
  end

  test 'limits password length to 15 characters' do
    user = build(:user, password: 'a' * 16)
    assert_not user.valid?
    assert_equal ["Password is too long (maximum: 15 characters)"], user.errors.full_messages
  end

  test 'validates that first, middle, and last names do not contain numbers' do
    user = build(:user, first_name: 'Juan123', middle_name: 'T4m4d', last_name: 'D3l4 Cruz')
    assert_not user.valid?
    assert_equal [
      "First name should only contain letters",
      "Middle name should only contain letters",
      "Last name should only contain letters"
    ], user.errors.full_messages
  end

  test 'capitalizes first, middle, and last names before saving' do
    user = create(:user, first_name: 'juan', middle_name: 'tamad', last_name: 'dela cruz')
    assert_equal 'Juan', user.first_name
    assert_equal 'Tamad', user.middle_name
    assert_equal 'Dela Cruz', user.last_name
  end
end


