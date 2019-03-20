class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.string :award_rule, null: false
      t.string :badge_param, null: false

      t.timestamps
    end
  end
end
