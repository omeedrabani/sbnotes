require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  def setup
  	@note = Note.new(title: "Example", text: "Lorem ipsum something!",
  		is_public: true)
  end

  test "should be valid" do
  	assert @note.valid?
  end

  test "title should be present" do
  	@note.title = ""
  	assert_not @note.valid?
  end

  test "empty text should be valid" do
  	@note.text = ""
  	assert @note.valid?
  end

end
