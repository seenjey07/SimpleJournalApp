class AddUsernameToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :username, :string
  end
end
