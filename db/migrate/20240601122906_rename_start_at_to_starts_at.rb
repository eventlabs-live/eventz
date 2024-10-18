class RenameStartAtToStartsAt < ActiveRecord::Migration[7.1]
  def change
    rename_column :events, :start_at, :starts_at
  end
end
