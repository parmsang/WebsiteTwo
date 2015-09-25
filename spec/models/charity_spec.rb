require 'rails_helper'

describe Charity, type: :model do
  it { is_expected.to have_many :requests }

  it 'is not valid unless it has a title' do
    charity = Charity.create(organisation_title: '', email: 'test@test.com', password:'randomness', password_confirmation:'randomness')
    expect(charity).to have(1).error_on(:organisation_title)
  end

  it 'is not valid unless it has a status' do
    charity = Charity.create(status: '')
    expect(charity).to have(1).error_on(:status)
  end

end
