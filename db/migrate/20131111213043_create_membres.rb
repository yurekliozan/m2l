class CreateMembres< ActiveRecord::Migration
  def up
    create_table :membres do |t|
      t.string :nom
      t.string :prenom
      t.date :datenaiss
      t.text :adresse
      t.integer :cp
      t.integer :numtel
      t.timestamps
    end
  end

  def down
    drop_table :membres
  end
end
