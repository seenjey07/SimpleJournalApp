require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @user_due_date = Date.today + 7.days
  end

  test "should get category with tasks" do
    category = categories(:one)
    task = Task.create(title: "Task 1", description: "Description 1", due_date: @user_due_date, category: @category)
    
    get category_url(@category)
    assert_response :success

    assert_select 'h1', @category.name
    assert_select '.categories_list li', test: task.title
  end
end