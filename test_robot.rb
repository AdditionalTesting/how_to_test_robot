require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_neeing_repairs_sent_to_station_1
    # arrange
    robotone = Robot.new
    robotone.needs_repairs = true
    robotone.foreign_model = true
    # act
    repair = robotone.station
    # assert
      assert_equal(1, repair)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
      robottwo = Robot.new
      robottwo.vintage_model = true
      robottwo.needs_repairs = true
    # act
      repair = robottwo.station
    # assert
    assert_equal(2, robottwo.station)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    robotthree = Robot.new
    robotthree.needs_repairs = true

    # act
    repair = robotthree.station

    # assert
    assert_equal(3, repair)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
      robotfour = Robot.new
    # act
      repair = robotfour.station
    # assert
    assert_equal(4, repair)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
      robotfive = Robot.new
    # act
      tasks = robotfive.prioritize_tasks
    # assert
    assert_equal(-1, tasks)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
      robotsix = Robot.new
      robotsix.todos << 2
      robotsix.todos << 3
      robotsix.todos << 4

    # act
      tasks = robotsix.prioritize_tasks
    # assert
    assert_equal(robotsix.todos.max, tasks)
  end

  def test_workday_on_day_off_returns_false
    # arrange
      robotseven = Robot.new
    # act
      robotseven.day_off = "t"
    # assert
    assert_equal(false, robotseven.workday?("t") )
  end

  def test_workday_not_day_off_returns_true
    # arrange
    roboteight = Robot.new
    roboteight.day_off = "s"
    # act
    # assert
    assert_equal(true, roboteight.workday?("t"))
  end

end
