class AddAnonymousToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :anonymous, :boolean, null: false, default: false
  end
end
