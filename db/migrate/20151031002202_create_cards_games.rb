class CreateCardsGames < ActiveRecord::Migration
  def change
    create_table :card_dealings do |t|
      t.integer :game_id
      t.references :cardable, polymorphic: true, index: true
      t.integer :card_id
      t.timestamps null: false
    end
  end
end
