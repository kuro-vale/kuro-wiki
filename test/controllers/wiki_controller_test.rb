require 'test_helper'

class WikiControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    Rails.application.load_seed
    @user = users(:one)
    @wiki = wiki(:one)
  end

  test 'should get index' do
    get wiki_index_url
    assert_response :success
  end

  test 'should get new' do
    sign_in @user
    get new_wiki_url
    assert_response :success
  end

  test 'should create wiki' do
    sign_in @user
    assert_difference('Wiki.count') do
      post wiki_index_url, params: { wiki: { body: @wiki.body, title: @wiki.title, category: @wiki.category } }
    end

    assert_redirected_to wiki_url(Wiki.last)
  end

  test 'should show wiki' do
    get wiki_url(@wiki, locale: 'en')
    assert_response :success
  end

  test 'should get edit' do
    sign_in @user
    get edit_wiki_url(@wiki, locale: 'en')
    assert_response :success
  end

  test 'should update wiki' do
    sign_in @user
    patch wiki_url(@wiki, locale: 'en'), params: { wiki: { body: @wiki.body, title: @wiki.title, category: @wiki.category } }
    assert_redirected_to wiki_url(@wiki)
  end

  test 'should destroy wiki' do
    sign_in @user
    assert_difference('Wiki.count', -1) do
      delete wiki_url(@wiki, locale: 'en')
    end

    assert_redirected_to wiki_index_url(anchor: 'wikis')
  end
end
