class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :country
      t.string :email
      t.timestamps
    end
  end
end
