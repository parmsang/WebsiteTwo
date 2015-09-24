require 'rails_helper'

describe Charity, type: :model do
  it { is_expected.to have_many :requests }
end
