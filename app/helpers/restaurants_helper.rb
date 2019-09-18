module RestaurantsHelper
  def display_rating(restaurant)
    return unless restaurant.ratings.exists?

    rating = (restaurant.ratings.sum(:rate) / restaurant.ratings.size.to_f).round(2)

    content_tag(:div) do
        concat(content_tag(:span, rating) + display_rating_stars(rating))
    end
  end

  def display_rating_stars(rating)
    html = content_tag(:i, nil, class: 'fa fa-star text-warning') * rating.to_i
    html += content_tag(:i, nil, class: 'fa fa-star-half text-warning') if rating.modulo(1) > 0

    content_tag(:span) do
      concat(html.html_safe)
    end
  end
end
