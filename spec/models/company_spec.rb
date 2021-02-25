require 'rails_helper'

RSpec.describe Company, type: :model do
  before do
    @company = build(:company)
  end

  it '情報が全て入力されている場合、有効である' do
    expect(@company).to be_valid
  end

  it 'nameが入力されていない場合、無効である' do
    @company.name = nil
    @company.valid?

    expect(@company.errors[:name]).to include('を入力してください')
  end

  it 'foundation_yearが選択されていない場合、無効である' do
    @company.foundation_year = nil
    @company.valid?

    expect(@company.errors[:foundation_year]).to include('を選択してください')
  end

  it 'president_nameが入力されていない場合、無効である' do
    @company.president_name = nil
    @company.valid?

    expect(@company.errors[:president_name]).to include('を入力してください')
  end

  it 'capitalが入力されていない場合、無効である' do
    @company.capital = nil
    @company.valid?

    expect(@company.errors[:capital]).to include('を入力してください')
  end

  it 'number_of_employeesが入力されていない場合、無効である' do
    @company.number_of_employees = nil
    @company.valid?

    expect(@company.errors[:number_of_employees]).to include('を入力してください')
  end

  it 'number_of_employeesが501文字以上の場合、無効である' do
    @company.number_of_employees = 'a' * 501
    @company.valid?

    expect(@company.errors[:number_of_employees]).to include('は500文字以内で入力してください')
  end

  it 'business_outlineが1001文字以上で入力された場合、無効である' do
    @company.business_outline = 'あ' * 1001
    @company.valid?

    expect(@company.errors[:business_outline]).to include('は1000文字以内で入力してください')
  end

  it 'revenueが501字以上で入力された場合、無効である' do
    @company.revenue = 'あ' * 501
    @company.valid?

    expect(@company.errors[:revenue]).to include('は500文字以内で入力してください')
  end

  it 'urlが空欄の場合、無効である' do
    @company.url = nil
    @company.valid?

    expect(@company.errors[:url]).to include('は正しい形式で入力してください')
  end

  it 'urlの形式が不正の場合、無効である' do
    @company.url = "www"
    @company.valid?

    expect(@company.errors[:url]).to include('は正しい形式で入力してください')
  end
end
