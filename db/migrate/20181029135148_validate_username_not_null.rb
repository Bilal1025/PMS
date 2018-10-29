class ValidateUsernameNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null(:users, :username, false )
  end
end
