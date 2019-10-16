class RemoveIdFromVotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :votes, :id
  end
end
