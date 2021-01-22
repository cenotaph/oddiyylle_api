class AddCommentsToEntry < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :comments, :text
  end
end
