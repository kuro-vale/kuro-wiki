require 'test_helper'

class WikiTest < ActiveSupport::TestCase
  test 'should not save an empty wiki' do
    wiki = Wiki.new
    assert_not wiki.valid?
    assert_not_nil wiki.errors[:title], 'no validation error for title present'
    assert_not_nil wiki.errors[:body], 'no validation error for body present'
  end

  test 'should not save a wiki with a title lenght greater tha 50' do
    wiki = Wiki.new(title: 'a' * 51, body: 'WikiBody')
    assert_not wiki.valid?, 'wiki is valid with a title lenght of 51'
    assert_not_nil wiki.errors[:title], 'no validation error for title lenght'
  end

  test 'valid wiki' do
    wiki = Wiki.new(title: 'My Title', body: 'My Body')
    assert wiki.valid?
  end
end
