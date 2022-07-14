require "application_system_test_case"

class WikiTest < ApplicationSystemTestCase
  setup do
    @wiki = wiki(:one)
  end

  test "visiting the index" do
    visit wiki_url
    assert_selector "h1", text: "Wiki"
  end

  test "should create wiki" do
    visit wiki_url
    click_on "New wiki"

    fill_in "Body", with: @wiki.body
    fill_in "Title", with: @wiki.title
    click_on "Create Wiki"

    assert_text "Wiki was successfully created"
    click_on "Back"
  end

  test "should update Wiki" do
    visit wiki_url(@wiki)
    click_on "Edit this wiki", match: :first

    fill_in "Body", with: @wiki.body
    fill_in "Title", with: @wiki.title
    click_on "Update Wiki"

    assert_text "Wiki was successfully updated"
    click_on "Back"
  end

  test "should destroy Wiki" do
    visit wiki_url(@wiki)
    click_on "Destroy this wiki", match: :first

    assert_text "Wiki was successfully destroyed"
  end
end
