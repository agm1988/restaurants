ActiveAdmin.register Restaurant do
  permit_params :name, :description, :cousine, :logo, :is_open,
                working_hours_attributes: [:id, :week_day, :start_time, :end_time]

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
