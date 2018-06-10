class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :admin_user_id
      t.string :track_id

      t.timestamps
    end
  end
end
