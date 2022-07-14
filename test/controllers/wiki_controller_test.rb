require 'test_helper'

class WikiControllerTest < ActionDispatch::IntegrationTest
  setup do
    Rails.application.load_seed
    @wiki = wiki(:one)
  end

  test 'should get index' do
    get wiki_index_url
    assert_response :success
  end

  test 'should get new' do
    get new_wiki_url
    assert_response :success
  end

  test 'should create wiki' do
    assert_difference('Wiki.count') do
      post wiki_index_url, params: { wiki: { body: @wiki.body, title: @wiki.title } }
    end

    assert_redirected_to wiki_url(Wiki.last)
  end

  test 'should show wiki' do
    get wiki_url(@wiki)
    assert_response :success
  end

  test 'should get edit' do
    get edit_wiki_url(@wiki)
    assert_response :success
  end

  test 'should update wiki' do
    patch wiki_url(@wiki), params: { wiki: { body: @wiki.body, title: @wiki.title } }
    assert_redirected_to wiki_url(@wiki)
  end

  test 'should destroy wiki' do
    assert_difference('Wiki.count', -1) do
      delete wiki_url(@wiki)
    end

    assert_redirected_to wiki_index_url
  end
end
