class Categorization < ActiveRecord::Base
  belongs_to :item, dependent: :destroy, :counter_cache => true
  belongs_to :category, dependent: :destroy, :counter_cache => true
end
