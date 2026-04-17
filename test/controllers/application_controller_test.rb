require "test_helper"

class ApplicationControllerTest < ActiveSupport::TestCase
  test "set_name returns a User_ prefix and number within range" do
    controller = ApplicationController.new

    generated_name = controller.set_name

    assert_match(/\AUser_\d+\z/, generated_name)

    random_number = generated_name.split("_").last.to_i
    assert_includes(1..1000, random_number)
  end
end
