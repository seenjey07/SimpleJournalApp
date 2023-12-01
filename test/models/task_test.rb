require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "should be valid" do
    user_due_date = Date.today + 7.days
    task = Task.new(
      title: "Task 1",
      description: "Task Description",
      due_date: user_due_date,
      category_id: categories(:one).id
    )
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

  test "should create task for a category with user-defined due date" do
    category = categories(:one)
    user_due_date = Date.today + 7.days
    task = category.tasks.create(
      title: "New Task",
      description: "Task Description",
      due_date: user_due_date
    )

    assert_equal category, task.category
    assert_equal user_due_date, task.due_date
  end

  test "should update task title and due date with user-defined due date" do
    task = Task.create(
      title: "Task to Edit",
      description: "Task Description",
      category_id: categories(:one).id
    )

    updated_due_date = Date.today + 14.days
    task.update(title: "Updated Task", due_date: updated_due_date)

    assert_equal "Updated Task", task.reload.title
    assert_equal updated_due_date, task.due_date
  end
end
