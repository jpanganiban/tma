class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :msg_id
      t.string :message
      t.string :susbcription

      t.timestamps
    end
  end
end
