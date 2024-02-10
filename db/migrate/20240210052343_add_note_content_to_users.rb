class AddNoteContentToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :note_content, :text
  end
end
