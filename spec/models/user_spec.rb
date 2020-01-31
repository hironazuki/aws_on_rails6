require 'rails_helper'

RSpec.describe User, type: :model do
  it '名前がなければ無効な状態であること' do
    user = User.new(
      name: '',
      email: 'example@example.com'
    )
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  it 'emailがなければ無効な状態であること' do
    user = User.new(
      name: 'test',
      email: ''
    )
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  it '重複したemailなら無効な状態であること' do
    User.create(
      name: 'reg',
      email: 'example@example.com'
    )
    user = User.new(
      name: 'rico',
      email: 'example@example.com'
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
