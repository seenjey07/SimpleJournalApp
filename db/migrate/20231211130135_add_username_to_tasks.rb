class AddUsernameToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :username, :string
  end
end
