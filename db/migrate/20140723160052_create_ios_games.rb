class CreateIosGames < ActiveRecord::Migration
  def change
    create_table :ios_games do |t|

      t.timestamps
    end
  end
end
