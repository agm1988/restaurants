# frozen_string_literal: false
require 'rails_helper'

describe Rating, type: :model do
  specify 'has a valid factory' do
    expect(build(:rating)).to be_valid
  end

  describe 'associations' do
    specify do
      expect(subject).to belong_to(:restaurant)
    end
  end

  context 'validations' do
    subject { build(:rating) }
    it { should validate_presence_of(:rate) }
    it { should validate_presence_of(:restaurant) }
    it { should validate_numericality_of(:rate) }
    # it { should validate_inclusion_of(:rate).in_array(Rating::RATINGS) }
    it { should validate_numericality_of(:rate).is_greater_than(0).is_less_than_or_equal_to(5).only_integer }
  end
end
