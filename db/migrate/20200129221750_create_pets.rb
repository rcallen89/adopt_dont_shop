class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :image
      t.string :name
      t.text :description
      t.string :age
      t.string :sex
      t.string :status

      t.timestamp
    end
  end
end
