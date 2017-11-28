class AddStatusToFrame < ActiveRecord::Migration[5.1]
  def change
    add_column :frames, :status, :string
  end
end
