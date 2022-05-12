class CreateHumanNameSynesthesia < ActiveRecord::Migration[6.1]
  def change
    create_table :human_name_synesthesia do |t|
      t.integer :user_id
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
