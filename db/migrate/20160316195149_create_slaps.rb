class CreateSlaps < ActiveRecord::Migration
  def change
    create_table :slaps do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
