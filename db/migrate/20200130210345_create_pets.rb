class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :image
      t.string :name
      t.integer :approximate_age
      t.string :sex
	t.string :description
	t.string :adopt_status
	t.timestamps
    end
  end
end
