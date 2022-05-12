class CreateHumanNameSynesthesia < ActiveRecord::Migration[6.1]
  def change
    create_table :human_name_synesthesia do |t|
      t.string :name
      t.string :color
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
