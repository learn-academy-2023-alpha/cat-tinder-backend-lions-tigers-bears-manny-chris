class CreateBeasts < ActiveRecord::Migration[7.0]
  def change
    create_table :beasts do |t|
      t.string :name
      t.integer :age
      t.text :description
      t.text :image

      t.timestamps
    end
  end
end
