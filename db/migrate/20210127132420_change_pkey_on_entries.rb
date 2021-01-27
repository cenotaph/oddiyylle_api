class ChangePkeyOnEntries < ActiveRecord::Migration[6.1]
  def change
    execute "ALTER TABLE entries DROP CONSTRAINT entries_pkey"
    execute "ALTER TABLE entries ADD CONSTRAINT entries_pkey PRIMARY KEY(cookie)"
  end
end
