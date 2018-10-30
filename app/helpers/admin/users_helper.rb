module Admin::UsersHelper
  def roles_list
    User.roles.keys.reject{ |role| role == User::ADMIN }
  end
end
