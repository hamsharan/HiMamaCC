class CreateClockEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :clock_events do |t|
      t.string :clocktype
      t.datetime :time
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
