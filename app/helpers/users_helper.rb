module UsersHelper
  def roles_list
    User.roles.keys.reject{ |role| role == User::ADMIN }
  end

  def titalize(title)
    title.to_s.humanize
  end

  def boolean_to_string(flag)
    flag ? 'Yes' : 'No'
  end
end
