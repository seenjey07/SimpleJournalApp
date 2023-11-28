require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "should get category with tasks" do
    category = categories(:one)
    task = Task.create(title: "Task 1", description: "Description 1", category_id: category.id)

    get category_url(category)
    assert_response :success
    assert_select 'h1', category.name
    assert_select 'li', task.title 
  end
end
