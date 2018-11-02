class ProjectsController < ManagerController
  before_action :get_project, except: [:index, :new, :create]
  before_action :authenticate_manager, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.manager = current_user

    if @project.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def edit
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :client_id)
  end

  def get_project
    @project = Project.find(params[:id])
  end

  def authenticate_manager
    unless @project.manager == current_user
      flash[:error] = "Only the manager who has created the project can perform this action"
      redirect_to projects_path
    end
  end
end
