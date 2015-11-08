class AddNameAboutMeAndDateOfBirthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :about_me, :string
    add_column :users, :date_of_birth, :string


  end
end
