class AddMemoToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :memo, :string
  end
end
