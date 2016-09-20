class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :headline
      t.string :description
      t.integer :rating
      t.date :date
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
