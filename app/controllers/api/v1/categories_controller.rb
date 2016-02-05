module Api
  module V1
    #============= Categories JSON  RESPONSE ========================
    class CategoriesController < Api::V1::BaseController
   
      private

      def category_params
        params.require(:category).permit(:id, :name)
      end

     def query_params
        # this assumes that an item belongs to an category and has an :category_id
        # allowing us to filter by this
        params.permit(:name)
      end
    end 
  end
end