require 'rails_helper'

RSpec.describe User, type: :model do
  subject = described_class.new(email: 'sampleuser@gmail.com',
                                date_of_birth: DateTime.now - 19.years, password: 'sampleuser',
                                password_confirmation: 'sampleuser')

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a data of birth' do
    subject.date_of_birth = nil
    expect(subject).to_not be_valid
  end

  it 'is not adult' do
    subject.date_of_birth = DateTime.now - 15.years
    expect(subject.adult?).to eq(false)
  end

  it 'is adult' do
    subject.date_of_birth = DateTime.now - 19.years
    expect(subject.adult?).to eq(true)
  end
end
