require "minitest/autorun"
require "minitest/pride"
require "./lib/activity"

class ActivityTest < MiniTest::Test

	def setup
    @activity = Activity.new("Brunch")
	end

	def test_it_exists_with_attributes
		assert_instance_of Activity, @activity
    assert_equal "Brunch", @activity.name
	end

end
