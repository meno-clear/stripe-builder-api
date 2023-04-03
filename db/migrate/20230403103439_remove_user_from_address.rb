class RemoveUserFromAddress < ActiveRecord::Migration[7.0]
  def change
    remove_reference :addresses, :user, null: false, foreign_key: true
  end
end
