# frozen_string_literal: true

class AddRolesColumnInUsersTable < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :string, default: 'user'
  end
end
