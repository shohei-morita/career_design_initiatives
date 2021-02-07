require 'rails_helper'

RSpec.describe Qualification, type: :model do
  before do
    @qualification = build(:qualification)
  end

  it '情報が全て入力されている場合、有効である' do
    expect(@qualification).to be_valid
  end

  it 'qualification_1stが50文字を超えている場合、無効である' do
    @qualification.qualification_1st = 'a' * 51
    @qualification.valid?

    expect(@qualification.errors[:qualification_1st]).to include('は50文字以内で入力してください')
  end

  it 'qualification_2ndが50文字を超えている場合、無効である' do
    @qualification.qualification_2nd = 'a' * 51
    @qualification.valid?

    expect(@qualification.errors[:qualification_2nd]).to include('は50文字以内で入力してください')
  end

  it 'qualification_3rdが50文字を超えている場合、無効である' do
    @qualification.qualification_3rd = 'a' * 51
    @qualification.valid?

    expect(@qualification.errors[:qualification_3rd]).to include('は50文字以内で入力してください')
  end

  it 'qualification_4thが50文字を超えている場合、無効である' do
    @qualification.qualification_4th = 'a' * 51
    @qualification.valid?

    expect(@qualification.errors[:qualification_4th]).to include('は50文字以内で入力してください')
  end

  it 'qualification_5thが50文字を超えている場合、無効である' do
    @qualification.qualification_5th = 'a' * 51
    @qualification.valid?

    expect(@qualification.errors[:qualification_5th]).to include('は50文字以内で入力してください')
  end

  it 'noteが500文字を超えている場合、無効である' do
    @qualification.note = 'a' * 501
    @qualification.valid?

    expect(@qualification.errors[:note]).to include('は500文字以内で入力してください')
  end
end
