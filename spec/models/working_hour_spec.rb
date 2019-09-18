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
  end

  specify do
    should define_enum_for(:week_day).with_values(WorkingHour::WEEK_DAYS)
  end
end
