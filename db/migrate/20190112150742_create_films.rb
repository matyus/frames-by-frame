class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title
      t.integer :hours
      t.integer :minutes
      t.integer :seconds
      t.integer :millseconds
      t.string :source_file
      t.string :output_directory

      t.timestamps
    end
  end
end
