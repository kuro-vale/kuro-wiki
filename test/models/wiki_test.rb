require 'test_helper'

class WikiTest < ActiveSupport::TestCase
  test 'should not save an empty wiki' do
    wiki = Wiki.new
    assert_not wiki.valid?
    assert_not_nil wiki.errors[:title], 'no validation error for title present'
    assert_not_nil wiki.errors[:body], 'no validation error for body present'
    assert_not_nil wiki.errors[:category], 'no validation error for category present'
    assert_not_nil wiki.errors[:user], 'no validation error for user present'
  end

  test 'should not save a wiki with a title lenght greater than 50' do
    wiki = Wiki.new(title: 'a' * 51, body: 'WikiBody')
    assert_not wiki.valid?, 'wiki is valid with a title lenght of 51'
  end

  test 'should not save a wiki with invalid category' do
    assert_raise(ArgumentError) { Wiki.new(title: 'My Title', body: 'My Body', category: 'crypto', user: User.new) }
  end

  test 'valid wiki' do
    wiki = Wiki.new(title: 'My Title', body: 'My Body', category: 'games', user: User.new)
    assert wiki.valid?
  end
end
