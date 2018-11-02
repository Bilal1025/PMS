module ProjectsHelper
  def total_project_earning(project)
    project.payments.sum(:amount)
  end
end
