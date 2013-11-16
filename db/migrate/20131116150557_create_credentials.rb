class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.string :access_token
      t.string :subscriber
      t.string :subscription

      t.timestamps
    end
  end
end
