class ClientsController < ManagerController
  before_action :get_client, except: [:index, :new, :create]

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to clients_path
    else
      render 'new'
    end
  end

  def update
    if @client.update(client_params)
      redirect_to client_path(@client)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  def edit
  end

  private

  def client_params
    params.require(:client).permit(:name)
  end

  def get_client
    @client = Client.find(params[:id])
  end
end
