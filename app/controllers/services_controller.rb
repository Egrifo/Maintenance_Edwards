class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index, :show]
  access all: [:show, :index], user: {
    except: [:destroy, :new, :create, :edit]}, site_admin: :all, engineer: :all, technician: {except: [:destroy, :new, :create]}
  layout 'service'
  # GET /services
  # GET /services.json
  def index
    if current_user.roles.include? :engineer
       @services = Service.all 
       #@contracts = Contract.all
       #@appliances = Appliance.all
       @title_index = 'Assets available'
      else 
      if current_user.roles.include? :technician
      @services = Service.all
      @contracts = Contract.left_joins(:service).where('contracts.user_id' => current_user.id)
      @title_index = 'These are your inventory items'
      end
    end
    #@commodate=@contracts.sum(&:asset)
    @commodate=0
    @deposit=760
    if @commodate=0
      @risk=100
    else
    @risk= @deposit/@commodate
    end
    #@services = Service.rent
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @contracts = @service.contracts
  end
  # GET /services/new
  def new
    @service = Service.new
    @tenants = User.where('roles' => 'tenant')
    #@service=current_user.services.build
    #@service.user_id=current_user.id
  end

  # GET /services/1/edit
  def edit
    if current_user.roles.include? :landlord
           @tenants = User.where('roles' => 'tenant')
    end
    #@service.user_id=current_user.id
  end
  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    #@service = current_user.services.build(service_params)
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :description, :condition, :included, :price, :title, :duration, :cost,
       contracts_attributes: [:id, :reference, :duration, :_destroy, :_download, :user_id, :service_id, :asset, :thumb_image],
       users_attributes: [:id, :name],
       transactions_attributes: [:id, :contract_id, :appliance_id, :Committed_Value])
    end
    
end