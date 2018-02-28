class ClientsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @client = Client.new
    respond_to do |format|
      format.html {render :layout=> false}
    end
  end

  def index
    @clients = Client.all
    respond_to do |format|
      format.html {render :layout=> false}
      format.json { @clients = Client.search(params[:term]) }
    end
  end

  def show
    @client = Client.find(params[:id])
    respond_to do |format|
      format.html {render :layout=> false}
    end
  end

  def create
    @client = Client.new(client_params)
    @clients = Client.all
    respond_to do |format|
      if @client.save
        format.js { render json: [@clients.last], status: :created }
      else
        flash[:quote_errors] = @client.errors.full_messages
        format.html { redirect_to new_client_path, status: :unprocessable_entity }
      end
    end
  end

  private

    def client_params
      params.require(:client).permit(:name, :direction, :phone, :identification)
    end
end
