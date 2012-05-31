class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :title
      t.integer :year
      
      t.timestamps
    end
  end
end
