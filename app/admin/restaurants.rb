ActiveAdmin.register Restaurant do
  permit_params :name, :description, :cousine, :logo, :is_open,
                working_hours_attributes: [:id, :week_day, :start_time, :end_time]

  scope :all
  scope :open
  scope :closed

  index do
    selectable_column
    column :id
    column :name
    column :description
    column :cousine
    column :logo do |restaurant|
      image_tag(restaurant.logo_url(:thumb))
    end
    column :open do |restaurant|
      restaurant.is_open ? "Open" : "Closed"
    end
    column :created_at
    column :updated_at
    column :rating do |restaurant|
      display_rating(restaurant) || 'Not Specified'
    end
    actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :description, label: 'Description'
      f.input :cousine
      f.input :logo
      f.input :is_open
    end
    f.inputs do
      f.has_many :working_hours,
                 new_record: 'Add Working Hours',
                 allow_destroy: true do |wh|
        wh.input :week_day
        wh.input :start_time, label: 'Opens At:'
        wh.input :end_time, label: 'Close At:'
      end
    end
    f.actions
  end
end
