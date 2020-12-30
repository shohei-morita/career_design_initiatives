require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = build(:address)
  end

  it '情報が全て入力されている場合、有効である' do
    expect(@address).to be_valid
  end

  it '郵便番号が空欄の場合、無効である' do
    @address.postcode = nil
    @address.valid?

    expect(@address.errors[:postcode]).to include('は７桁の数値で入力してください')
  end

  it '郵便番号が数字ではない場合、無効である' do
    @address.postcode = 'アイウエオカキ'
    @address.valid?

    expect(@address.errors[:postcode]).to include('は７桁の数値で入力してください')
  end

  it '郵便番号が7桁ではない場合、無効である' do
    @address.postcode = 12345678
    @address.valid?

    expect(@address.errors[:postcode]).to include('は７桁の数値で入力してください')
  end

  it '都道府県が選択されていない場合、無効である' do
    @address.prefecture_code = nil
    @address.valid?

    expect(@address.errors[:prefecture_code]).to include('を選択してください')
  end

  it '市区町村が空欄の場合、無効である' do
    @address.address_city = nil
    @address.valid?

    expect(@address.errors[:address_city]).to include('を入力してください')
  end

  it '番地が空欄の場合、無効である' do
    @address.address_street = nil
    @address.valid?

    expect(@address.errors[:address_street]).to include('を入力してください')
  end
end
