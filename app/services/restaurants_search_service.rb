module RestaurantsSearchService
  def self.call(params)
    restaurants = if params[:search].present?
                    Restaurant
                      .open
                      .where('name like :query OR description like :query OR cousine like :query',
                             query: "%#{params[:search][:query]}%")
                  else
                    Restaurant.open
                  end

    restaurants.page(params[:page])
  end
end
