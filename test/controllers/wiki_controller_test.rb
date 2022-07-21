# rubocop:disable Metrics/ClassLength
# frozen_string_literal: true

require 'test_helper'

class WikiControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    Rails.application.load_seed
    @user = users(:one)
    @wiki = wiki(:one)
    @unauthorized_user = users(:two)
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
      post wiki_index_url, params: { wiki: { body_en: @wiki.body, title_en: @wiki.title, category: @wiki.category } }
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

  test 'should not get edit if wiki don\'t belong to user' do
    sign_in @unauthorized_user
    get edit_wiki_url(@wiki, locale: 'en')
    assert_redirected_to wiki_index_url
  end

  test 'should update wiki' do
    sign_in @user
    patch wiki_url(@wiki, locale: 'en'),
          params: { wiki: { body_en: @wiki.body, title_en: @wiki.title, category: @wiki.category } }
    assert_redirected_to wiki_url(@wiki)
  end

  test 'should not update wiki if wiki don\'t belong to user' do
    sign_in @unauthorized_user
    patch wiki_url(@wiki, locale: 'en'),
          params: { wiki: { body_en: @wiki.body, title_en: @wiki.title, category: @wiki.category } }
    assert_redirected_to wiki_index_url
  end

  test 'should destroy wiki' do
    sign_in @user
    assert_difference('Wiki.count', -1) do
      delete wiki_url(@wiki, locale: 'en')
    end

    assert_redirected_to wiki_index_url(anchor: 'wikis')
  end

  test 'should not destroy if wiki don\'t belong to user' do
    sign_in @unauthorized_user
    delete wiki_url(@wiki, locale: 'en')
    assert_redirected_to wiki_index_url
  end

  test 'should get edit translation' do
    sign_in @user
    get edit_translation_url(@wiki, locale: 'es')
    assert_response :success
  end

  test 'should not get edit translation if wiki don\'t belong to user' do
    sign_in @unauthorized_user
    get edit_translation_url(@wiki, locale: 'es')
    assert_redirected_to wiki_index_url
  end

  test 'should update wiki translation' do
    sign_in @user
    patch update_translation_url(@wiki, locale: 'es'),
          params: { wiki: { body_es: 'Contenido', title_es: 'Titulo', category: @wiki.category } }
    assert_redirected_to wiki_url(@wiki)
  end

  test 'should not update wiki translation if wiki don\'t belong to user' do
    sign_in @unauthorized_user
    patch update_translation_url(@wiki, locale: 'es'),
          params: { wiki: { body_es: 'Contenido', title_es: 'Titulo', category: @wiki.category } }
    assert_redirected_to wiki_index_url
  end

  test 'should redirect to root without auth' do
    get new_wiki_url
    assert_redirected_to root_path
    post wiki_index_url, params: { wiki: { body_en: @wiki.body, title_en: @wiki.title, category: @wiki.category } }
    assert_redirected_to root_path
    get edit_wiki_url(@wiki, locale: 'en')
    assert_redirected_to root_path
    patch wiki_url(@wiki, locale: 'en'),
          params: { wiki: { body_en: @wiki.body, title_en: @wiki.title, category: @wiki.category } }
    assert_redirected_to root_path
    delete wiki_url(@wiki, locale: 'en')
    assert_redirected_to root_path
    get edit_translation_url(@wiki, locale: 'es')
    assert_redirected_to root_path
    patch update_translation_url(@wiki, locale: 'es'),
          params: { wiki: { body_es: 'Contenido', title_es: 'Titulo', category: @wiki.category } }
    assert_redirected_to root_path
  end
end
# rubocop:enable Metrics/ClassLength
