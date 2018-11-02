class PaymentsController < ManagerController
  before_action :get_project
  before_action :authenticate_manager

  def create
    @payment = Payment.new(payment_params)
    @payment.project = @project

    if @payment.save
      redirect_to project_path(@project)
    else
      render("projects/show")
    end
  end

  def destroy
    @payment = @project.payments.find(params[:id])
    @payment.destroy
    redirect_to project_path(@project)
  end

  def update
    @payment = @project.payments.find(params[:id])
    @payment.update(payment_params)
    respond_to do |format|
      format.json { head :ok }
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:amount)
  end

  def get_project
    @project = Project.find(params[:project_id])
  end

  def authenticate_manager
    unless @project.manager == current_user
      flash[:error] = "Only the manager who has created the project can perform this action"
      redirect_to projects_path
    end
  end
end
