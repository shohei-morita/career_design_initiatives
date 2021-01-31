require 'rails_helper'

RSpec.describe ScoutMessage, type: :model do
  before do
    @scout_message = build(:scout_message)
  end

  it '情報が全て入力されている場合、有効である' do
    expect(@scout_message).to be_valid
  end

  it 'titleが空欄の場合、無効である' do
    @scout_message.content = nil
    @scout_message.valid?

    expect(@scout_message.errors[:content]).to include('を入力してください')
  end

  it 'contentが1001文字以上の場合、無効である' do
    @scout_message.content = 'a' * 1001
    @scout_message.valid?

    expect(@scout_message.errors[:content]).to include('は1000文字以内で入力してください')
  end
end
