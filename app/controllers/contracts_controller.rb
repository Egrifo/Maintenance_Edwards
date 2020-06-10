class ContractsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contract, only: [:show, :edit, :update, :destroy, :download]
  access user: {
    except: [:destroy, :new, :create, :edit]},
    admin: :all, 
    landlord: :all, 
    tenant: {except: [:destroy, :new, :create]}
#validates_attachment_presence :registration
  layout 'service'
  # GET /contracts
  def index
  end
  # GET /contracts/1
  def show
    @commodate = @contract.transactions.where(item: 0)
    @inventory = @contract.appliances.all
    #@inventory = @contract.transactions
    @caparra=@commodate.sum(&:Committed_Value)
    @contract.asset=@caparra
    
    respond_to do |format|
      format.pdf do
        pdf = ReceiptPdf.new(@contract)
        send_data pdf.render,
                  filename: "Contract_#{@contract.id}",
                  type: 'application/pdf'
      end
      format.html 
  end
  end
  # GET /contracts/new
  def new
    if current_user.roles.include? :landlord
    @contract = Contract.new
    @asset = Appliance.all 
    @tenant = User.tenants
    @service = Service.all
    end
  end

  # GET /contracts/1/edit
  def edit
    a = @contract.id
    if current_user.roles.include? :landlord
      #@asset = Appliance.all - @contract.appliances
      @service = Service.all
      @tenant = User.tenants
      @asset = Appliance.left_outer_joins(:transactions).distinct.order(purchasing_cost: :desc)
    end 
  end

  # POST /contracts
  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract, notice: 'Contract was successfully created.'
    else
      render :new
    end
  end
  # PATCH/PUT /contracts/1
  def update
    @contract.asset=@contract.transactions.sum(&:Committed_Value)
    
    #@transaction=Transaction.new
    #@transaction.update(contract_id: @contract.id)
    if @contract.update(contract_params)
      redirect_to dashboard_url, notice: 'Contract was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /contracts/1
  def destroy
    @contract.destroy
    redirect_to services_url, notice: 'Contract was successfully destroyed.'
  end

  
  def download 
  @contract = Contract.find(params[:id])
  respond_to do |format|
  format.html do
        image = @contract.thumb_image
        if image.try(:file).exists?
          data = open(image.url)
          send_data data.read, 
                type: data.content_type, 
                x_sendfile: true
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contract_params
      params.require(:contract).permit(:reference, :serial, :id, :duration, :description, :price, :user_id, :service_id, :asset, :registration, 
        :thumb_image,
        transactions_attributes: [:id, :name, :Committed_Value, :_new,:_create, :_destroy, :contract_id, :appliance_id],
        appliances_attributes: [:id, :name, :purchasing_cost],
        users_attributes: [:id, :name],
        services_attributes: [:id, :name])
    end
 
end
