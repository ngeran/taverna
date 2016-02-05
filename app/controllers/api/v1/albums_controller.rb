module Api
  module V1
    #============= Categories JSON  RESPONSE ========================
    class AlbumsController < Api::V1::BaseController

      private

      def album_params
        params.require(:album).permit(:id, :title, :description)
      end

      def query_params
        # this assumes that an item belongs to an category and has an :category_id
        # allowing us to filter by this
        params.permit(:title)
      end
    end
  end
end