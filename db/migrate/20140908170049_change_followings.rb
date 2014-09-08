class ChangeFollowings < ActiveRecord::Migration
  def change
    add_column :followings, :user_email, :string
  end
end
