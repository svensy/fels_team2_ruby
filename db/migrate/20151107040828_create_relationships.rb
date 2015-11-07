class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.string :following_id
      t.string :followed_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
