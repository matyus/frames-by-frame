class ChangeMillsecondsToMilliseconds < ActiveRecord::Migration[5.2]
  def change
    rename_column :films, :millseconds, :milliseconds
  end
end
