require 'rails_helper'

RSpec.describe EducationalBackground, type: :model do
  before do
    @educational_background = build(:educational_background)
  end

  it '情報が全て入力されている場合、有効である' do
    expect(@educational_background).to be_valid
  end

  it 'locationが選択されていない場合、無効である' do
    @educational_background.location = nil
    @educational_background.valid?

    expect(@educational_background.errors[:location]).to include('を選択してください')
  end

  it 'divisionが選択されていない場合、無効である' do
    @educational_background.division = nil
    @educational_background.valid?

    expect(@educational_background.errors[:division]).to include('を選択してください')
  end

  it 'school_nameが記載されていない場合、無効である' do
    @educational_background.school_name = nil
    @educational_background.valid?

    expect(@educational_background.errors[:school_name]).to include('を入力してください')
  end

  it 'school_nameが50文字を超える場合、無効である' do
    @educational_background.school_name = "a" * 51
    @educational_background.valid?

    expect(@educational_background.errors[:school_name]).to include('は50文字以内で入力してください')
  end

  it 'entrance_dateが空欄の場合、無効である' do
    @educational_background.entrance_date = nil
    @educational_background.valid?

    expect(@educational_background.errors[:entrance_date]).to include('を選択してください')
  end

  it 'graduation_dateが空欄の場合、無効である' do
    @educational_background.graduation_date = nil
    @educational_background.valid?

    expect(@educational_background.errors[:graduation_date]).to include('を選択してください')
  end

  it 'noteが500文字を超えた場合、無効である' do
    @educational_background.note = "a" * 501
    @educational_background.valid?

    expect(@educational_background.errors[:note]).to include('は500文字以内で入力してください')
  end

end
