module Api
  module V1
    #============= ITEMS RESPONSE ========================
    class ItemsController < Api::V1::BaseController
      private
      
      def item_params
        params.require(:item).permit(:titlegr)
      end
      def query_params
        params.permit(:category_id, :titlegr)
      end
    end
  end
end