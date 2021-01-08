require 'rails_helper'

RSpec.describe Award, type: :model do
  before do
    @award = build(:award)
  end

  it '情報が全て入力されている場合、有効である' do
    expect(@award).to be_valid
  end

  it 'titleが入力されていない場合、無効である' do
    @award.title = nil
    @award.valid?

    expect(@award.errors[:title]).to include('を入力してください')
  end

  it 'titleが50文字を超える場合、無効である' do
    @award.title = 'a' * 51
    @award.valid?

    expect(@award.errors[:title]).to include('は50文字以内で入力してください')
  end

  it 'yearが空欄の場合、無効である' do
    @award.year = nil
    @award.valid?

    expect(@award.errors[:year]).to include('を選択してください')
  end

  it 'summaryが500文字を超える場合、無効である' do
    @award.summary = 'a' * 501
    @award.valid?

    expect(@award.errors[:summary]).to include('は500文字以内で入力してください')
  end
end
