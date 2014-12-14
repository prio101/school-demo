class AddApiUrlInSchool < ActiveRecord::Migration
  def change
    add_column :schools, :api_url, :string
  end
end
