# frozen_string_literal: false
require 'rails_helper'

describe WorkingHour, type: :model do
  specify 'has a valid factory' do
    expect(build(:working_hour)).to be_valid
  end

  describe 'associations' do
    specify do
      expect(subject).to belong_to(:restaurant)
    end
  end

  context 'validations' do
    subject { build(:working_hour) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    it { should validate_presence_of(:week_day) }
    it { should validate_uniqueness_of(:week_day).scoped_to(:restaurant_id).ignoring_case_sensitivity }
    it { should define_enum_for(:week_day).with(WorkingHour::WEEK_DAYS) }
  end

  specify do
    should define_enum_for(:week_day).with_values(WorkingHour::WEEK_DAYS)
  end
end
