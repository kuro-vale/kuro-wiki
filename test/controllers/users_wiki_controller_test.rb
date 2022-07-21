# frozen_string_literal: true

require 'test_helper'

class UsersWikiControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @wiki = wiki(:one)
  end
  test 'should get user\'s wikis index' do
    get users_wiki_url(username: @user.username)
    assert_response :success
  end
end
