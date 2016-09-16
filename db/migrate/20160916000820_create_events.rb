class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :venue_name
      t.string :address
      t.string :country
      t.string :description
      t.string :website_url
      t.string :purchase_url
      t.string :logo
      t.string :primary_image
      t.string :instagram
      t.string :hashtag
      t.string :facebook
      t.string :twitter
      t.string :instagram_api
      t.date :start_date
      t.date :end_date
      t.string :day_description
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
