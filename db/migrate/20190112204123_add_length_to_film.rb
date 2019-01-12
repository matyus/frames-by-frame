class AddLengthToFilm < ActiveRecord::Migration[5.2]
  def change
    add_column :films, :length, :string
  end
end
