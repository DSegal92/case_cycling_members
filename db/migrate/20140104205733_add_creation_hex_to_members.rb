class AddCreationHexToMembers < ActiveRecord::Migration
  def change
    add_column :members, :creation_hex, :string
  end
end
