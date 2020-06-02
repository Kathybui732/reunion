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

  def test_it_starts_with_no_participants
    assert_equal ({}), @activity.participants
  end

  def test_it_can_add_participants
    @activity.add_participant("Maria", 20)
    assert_equal ({"Maria" => 20}), @activity.participants
  end

  def test_total_cost
    @activity.add_participant("Maria", 20)
    assert_equal 20, @activity.total_cost
    @activity.add_participant("Luther", 40)
    assert_equal ({"Maria" => 20, "Luther" => 40}), @activity.participants
    assert_equal 60, @activity.total_cost
  end
end
