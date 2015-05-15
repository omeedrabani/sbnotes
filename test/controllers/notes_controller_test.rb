require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save without title" do
  	note = Note.new
  	assert_not note.save
  end

  test "should save with title" do
  	note = Note.new(title: "fillerTitle")
  	assert note.save
  end
end
