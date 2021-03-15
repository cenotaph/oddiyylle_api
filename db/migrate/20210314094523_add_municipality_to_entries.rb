class AddMunicipalityToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :municipality, :string
  end
end
