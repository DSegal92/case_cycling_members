class AddIsConfirmedToMembers < ActiveRecord::Migration
  def change
    add_column :members, :is_confirmed, :boolean
  end
end
