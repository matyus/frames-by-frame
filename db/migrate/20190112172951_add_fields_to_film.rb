class AddFieldsToFilm < ActiveRecord::Migration[5.2]
  def change
    add_column :films, :filename, :string, after: :title
    add_column :films, :size, :string, after: :title
  end
end
