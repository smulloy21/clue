class CreateCardPossibles < ActiveRecord::Migration
  def change
    create_table :card_possibles do |t|
      t.integer :player_id
      t.integer :card_id
      t.timestamps null: false
    end
  end
end
