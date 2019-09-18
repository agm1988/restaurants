# frozen_string_literal: false
require 'rails_helper'

describe Restaurant, type: :model do
  specify 'has a valid factory' do
    expect(build(:restaurant)).to be_valid
  end

  describe 'associations' do
    specify do
      expect(subject).to have_many(:ratings).dependent(:destroy)
      expect(subject).to have_many(:working_hours).dependent(:destroy)
    end
  end

  context 'validations' do
    subject { build(:restaurant) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:cousine) }

    specify 'uniqueness' do
      is_expected.to validate_uniqueness_of(:name).case_insensitive
    end
  end
end
