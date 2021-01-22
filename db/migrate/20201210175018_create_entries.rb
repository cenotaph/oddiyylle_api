class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :name
      t.string :email
      t.string :contact_details
      t.string :cookie
      t.boolean :submitted, default: false, null: false

      t.timestamps
    end
  end
end
