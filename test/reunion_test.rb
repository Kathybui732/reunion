require "minitest/autorun"
require "minitest/pride"
require "./lib/reunion"
require "./lib/activity"

class ReunionTest < MiniTest::Test

	def setup
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
	end

	def test_it_exists_with_attributes
		assert_instance_of Reunion, @reunion
    assert_equal "1406 BE", @reunion.name
	end

  def test_it_starts_with_no_activities_until_added
    assert_equal [], @reunion.activities
    @reunion.add_activity(@activity_1)
    assert_equal [@activity_1], @reunion.activities
  end
end
