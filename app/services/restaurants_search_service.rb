module RestaurantsSearchService
  def self.call(params)
    restaurants = if params[:search].present?
                    Restaurant
                      .open
                      .where('name ilike :query OR description ilike :query OR cousine ilike :query',
                             query: "%#{params[:search][:query]}%")
                  else
                    Restaurant.open
                  end

    restaurants.page(params[:page])
  end
end
