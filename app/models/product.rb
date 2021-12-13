class Product < ApplicationRecord
  belongs_to :category

  scope :search_category, -> (search_category) { where(category_id: search_category)}
  scope :search_name, -> (search_name) { where("name like ?", "%#{search_name}%")}
  scope :search, -> (search_params) {
    if search_params[:product_name]
      search_name(search_params[:product_name])
    else search_params[:category]
      search_category(search_params[:category])
    end
  }
end
