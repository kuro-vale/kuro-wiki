require 'test_helper'

class WikiTest < ActiveSupport::TestCase
  test 'should not save an empty wiki' do
    wiki = Wiki.new
    assert_not wiki.valid?
    assert_not_nil wiki.errors[:title_en], 'no validation error for title present'
    assert_not_nil wiki.errors[:body_en], 'no validation error for body present'
    assert_not_nil wiki.errors[:category], 'no validation error for category present'
    assert_not_nil wiki.errors[:user], 'no validation error for user present'
  end

  test 'should not save a wiki with a title lenght greater than 50' do
    wiki = Wiki.new(title_en: 'a' * 51, body_en: 'WikiBody')
    assert_not wiki.valid?, 'wiki is valid with a title lenght of 51'
  end

  test 'should not save a wiki with a title lenght greater than 50 in another locale' do
    wiki = Wiki.new(title_en: "a", body_en: "a", title_es: 'a' * 51, body_es: 'Contenido')
    assert_not wiki.valid?, 'wiki is valid with a title_es lenght of 51'
  end

  test 'should not save a wiki with invalid category' do
    assert_raise(ArgumentError) do
      Wiki.new(title_en: 'My Title', body_en: 'My Body', category: 'crypto', user: User.new)
    end
  end

  test 'valid wiki' do
    wiki = Wiki.new(title_en: 'My Title', body_en: 'My Body', category: 'games', user: User.new)
    assert wiki.valid?
  end
end
