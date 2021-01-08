require 'rails_helper'

RSpec.describe ExtracurricularActivity, type: :model do
  before do
    @extracurricular_activity = build(:extracurricular_activity)
  end

  it '情報が全て入力されている場合、有効である' do
    expect(@extracurricular_activity).to be_valid
  end

  it 'nameが入力されていない場合、無効である' do
    @extracurricular_activity.name = nil
    @extracurricular_activity.valid?

    expect(@extracurricular_activity.errors[:name]).to include('を入力してください')
  end

  it 'nameが50文字を超える場合、無効である' do
    @extracurricular_activity.name = 'a' * 51
    @extracurricular_activity.valid?

    expect(@extracurricular_activity.errors[:name]).to include('は50文字以内で入力してください')
  end

  it 'beginning_yearが空欄の場合、無効である' do
    @extracurricular_activity.beginning_year = nil
    @extracurricular_activity.ending_year = nil

    @extracurricular_activity.valid?

    expect(@extracurricular_activity.errors[:beginning_year]).to include('を選択してください')
  end

  it 'beginning_yearがending_yearよりも前の場合、無効である' do
    @extracurricular_activity.beginning_year = '2020/1/1'
    @extracurricular_activity.ending_year = '2019/1/1'

    @extracurricular_activity.valid?

    expect(@extracurricular_activity.errors[:ending_year]).to include('は開始年よりも前に設定しないでください')
  end

  it 'summaryが500文字を超える場合、無効である' do
    @extracurricular_activity.summary = 'a' * 501
    @extracurricular_activity.valid?

    expect(@extracurricular_activity.errors[:summary]).to include('は500文字以内で入力してください')
  end
end
