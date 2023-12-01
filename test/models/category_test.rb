require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should create category with valid name" do
    category = Category.new(name: "Personal")
    assert category.save
    assert category.persisted?
  end

  test "should not save category without a name" do
    category = Category.new
    assert_not category.save
    assert_equal ["Name can't be blank"], category.errors.full_messages
  end  

  test "should not allow duplicate category names" do
    Category.create(name: "Work")

    category = Category.new(name: "Work")
    assert_not category.valid?
    assert_equal ["Name has already been taken"], category.errors.full_messages
  end

  test "should add a task to the category" do
    category = Category.create(name: "Work")
    task = category.tasks.build(title: "Task 1", description: "Description 1", due_date: Date.today)
    
    assert task.save
    assert task.persisted?

    # assert task.valid?, "Task is not valid: #{task.errors.full_messages.join(', ')}"
    # assert task.save, "Task could not be saved: #{task.errors.full_messages.join(', ')}"  

    assert_equal 1, category.tasks.count
    assert_equal task, category.tasks.first
  end

  test "should update category name" do
    category = Category.create(name: "Work")
    category.update(name: "Personal")

    assert_equal "Personal", category.reload.name
  end
end
