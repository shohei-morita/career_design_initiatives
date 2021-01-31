require 'rails_helper'

RSpec.describe Scout, type: :model do
  before do
    @scout = build(:scout)
  end

  it '情報が全て入力されている場合、有効である' do
    expect(@scout).to be_valid
  end

  it 'titleが空欄の場合、無効である' do
    @scout.title = nil
    @scout.valid?

    expect(@scout.errors[:title]).to include('を入力してください')
  end

  it 'titleが51文字以上の場合、無効である' do
    @scout.title = 'a' * 51
    @scout.valid?

    expect(@scout.errors[:title]).to include('は50文字以内で入力してください')
  end
end
