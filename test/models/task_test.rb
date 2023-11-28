require "test_helper"

  class TaskTest < ActiveSupport::TestCase
    test "should be valid" do
      task = Task.new(title: "Task 1", category_id: categories(:one).id)
      assert task.valid?
  end

  test "title should be present" do
    task = Task.new(category_id: categories(:one).id)
    assert_not task.valid?
  end

  test "should belong to a category" do
    category = Category.create(name: "Work")
    task = Task.new(title: "Task 1", category_id: category.id)

    assert_equal category, task.category
  end

  test "should create task for a category" do
    category = categories(:one)
    task = category.tasks.create(title: "New Task", description: "Task Description")

    assert_equal category, task.category
  end

  test "should update task title" do
    task = Task.create(title: "Task to Edit", description: "Task Description", category_id: categories(:one).id)
    task.update(title: "Updated Task")

    assert_equal "Updated Task", task.reload.title
  end
end
