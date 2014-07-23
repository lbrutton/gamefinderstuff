class CreateAndroidGames < ActiveRecord::Migration
  def change
    create_table :android_games do |t|

      t.timestamps
    end
  end
end
