class AddReferenceToPools < ActiveRecord::Migration[6.0]
  def change
    add_reference :pools, :user, null: false, foreign_key: true
  end
end
