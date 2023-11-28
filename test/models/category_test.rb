require "test_helper"

  class CategoryTest < ActiveSupport::TestCase
    test "should be valid" do
      category = Category.new(name: "Work")
      assert category.valid?
  end

  test "name should be present" do
    category = Category.new
    assert_not category.valid?
  end

  test "should create category with tasks" do
    category = Category.create(name: "Work")
    task = Task.create(title: "Task 1", description: "Description 1", category_id: category.id)

    assert_equal 1, category.tasks.count
    assert_equal task, category.tasks.first
  end

  test "should update category name" do
    category = Category.create(name: "Work")
    category.update(name: "Personal")

    assert_equal "Personal", category.reload.name
  end
end
