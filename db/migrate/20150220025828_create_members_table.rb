class CreateMembersTable < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string  :fname
      t.string  :lname

      t.timestamps null: false
    end
  end
end
