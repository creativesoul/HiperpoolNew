class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :position
      t.string :email
      t.timestamps
    end
  end
end
