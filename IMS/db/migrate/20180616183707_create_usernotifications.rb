class CreateUsernotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :usernotifications do |t|
      t.integer :notification_id
      t.integer :student_id
      t.integer :seen ,default: 0
    end
  end
end
