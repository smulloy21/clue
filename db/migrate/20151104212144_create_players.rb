class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :game_id
      t.string :name
      t.string :img
      t.boolean :user, default: false
      t.timestamps null: false
    end
  end
end
