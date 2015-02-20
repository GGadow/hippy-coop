class CreateRoomsTable < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string    :room_number
      t.decimal   :rent          , :precision => 5, :scale => 2
      t.integer   :member_id

      t.timestamps null: false
    end
  end
end
