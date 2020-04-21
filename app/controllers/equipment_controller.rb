class EquipmentController < InheritedResources::Base

  private

    def equipment_params
      params.require(:equipment).permit(:name, :serial, :assetno, :description)
    end

end
