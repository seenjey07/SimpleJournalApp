require 'test_helper'

class TasksIntegrationTest < ActionDispatch::IntegrationTest
  test "can create a task for a category" do
    category = categories(:one)
    initial_task_count = Task.count

    post category_tasks_path(category), params: { task: { title: "New Task", description: "Task Description" } }

    assert_equal initial_task_count + 1, Task.count

    get new_category_task_path(category)
    assert_response :success

    assert_difference('Task.count', 1) do
      post category_tasks_path(category), params: { task: { title: "Another Task", description: "Another Task Description" } }
    end

    follow_redirect!
    assert_response :success
    assert_select 'li', 'Another Task'
  end

  test "can edit a task" do
    category = categories(:one)
    task = Task.create(title: "Task to Edit", description: "Task Description", category: category)

    get edit_category_task_path(category, task)
    assert_response :success

    patch category_task_path(category, task), params: { task: { title: "Updated Task", description: "Updated Task Description" } }

    assert_redirected_to category_path(category)

    follow_redirect!
    assert_response :success
    assert_select 'li', 'Updated Task'
  end
end
