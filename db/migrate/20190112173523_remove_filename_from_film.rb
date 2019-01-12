class RemoveFilenameFromFilm < ActiveRecord::Migration[5.2]
  def change
    remove_column :films, :filename
  end
end
