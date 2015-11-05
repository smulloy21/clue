class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :player_id
      t.timestamps null: false
    end
    create_table :accusations do |t|
      t.integer :player_id
      t.boolean :correct, default: false
      t.timestamps null: false
    end
    create_table :card_selections do |t|
      t.integer :player_id
      t.references :guessable, polymorphic: true, index: true
      t.integer :card_id
      t.timestamps null: false
    end
  end
end
