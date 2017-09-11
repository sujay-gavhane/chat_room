class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name, nil: false
      t.string :last_name, nil: false
      t.string :company
      t.references :user, :profile, foreign_key: true

      t.timestamps
    end
  end
end
