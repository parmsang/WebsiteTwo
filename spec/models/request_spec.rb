require 'rails_helper'

describe Request, type: :model do
  it { is_expected.to belong_to :charity }
end
