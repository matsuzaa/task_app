class AddContentsToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :contents, :string
  end
end
