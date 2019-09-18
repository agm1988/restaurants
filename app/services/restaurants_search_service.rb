module RestaurantsSearchService
  def self.call(params)
    restaurants = if params[:search].present?
                    Restaurant
                      .where('name like :query OR description like :query OR cousine like :query',
                             query: "%#{params[:search][:query]}%")
                  else
                    Restaurant.all
                  end

    restaurants.page(params[:page])
  end
end
