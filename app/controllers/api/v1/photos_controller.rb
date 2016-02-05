module Api
  module V1
    #============= Categories JSON  RESPONSE ========================
    class PhotosController < Api::V1::BaseController

      private

      def photo_params
        params.require(:photo).permit(:id, :title, :description, :image)
      end

      def query_params
        # this assumes that an item belongs to an category and has an :category_id
        # allowing us to filter by this
        params.permit(:title)
      end
    end
  end
end