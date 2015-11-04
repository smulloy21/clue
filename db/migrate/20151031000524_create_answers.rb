class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :game_id
      t.timestamps null: false
    end
  end
end
