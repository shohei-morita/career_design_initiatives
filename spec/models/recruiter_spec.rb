require 'rails_helper'

RSpec.describe Recruiter, type: :model do
  before do
    @recruiter = build(:recruiter)
  end

  it '全ての情報が入力されている場合、有効である' do
    expect(@recruiter).to be_valid
  end

  it 'emailがない場合、無効である' do
    @recruiter.email = nil
    @recruiter.invalid?

    expect(@recruiter.errors[:email]).to include('を入力してください')
  end

  it 'emailが重複している場合、無効である' do
    recruiter = create(:recruiter)
    another_recruiter = build(:recruiter, email: recruiter.email)
    another_recruiter.invalid?

    expect(another_recruiter.errors[:email]).to include('はすでに存在します')
  end

  it 'family_nameがない場合、無効である' do
    @recruiter.family_name = nil
    @recruiter.invalid?

    expect(@recruiter.errors[:family_name]).to include('を入力してください')
  end

  it 'given_nameがない場合、無効である' do
    @recruiter.given_name = nil
    @recruiter.invalid?

    expect(@recruiter.errors[:given_name]).to include('を入力してください')
  end

  it 'family_name_kanaがない場合、無効である' do
    @recruiter.family_name_kana = nil
    @recruiter.invalid?

    expect(@recruiter.errors[:family_name_kana]).to include('を入力してください')
  end

  it 'family_name_kanaがひらがなの場合、有効である' do
    @recruiter.family_name_kana = 'あいうえお'
    expect(@recruiter).to be_valid
  end

  it 'family_name_kanaがカタカナおよびひらがな以外の場合、有効である' do
    @recruiter.family_name_kana = 'sample田中'
    @recruiter.invalid?

    expect(@recruiter.errors[:family_name_kana]).to include('は「カタカナ」もしくは「ひらがな」で入力してください')
  end

  it 'given_name_kanaがない場合、無効である' do
    @recruiter.given_name_kana = nil
    @recruiter.invalid?

    expect(@recruiter.errors[:given_name_kana]).to include('を入力してください')
  end

  it 'given_name_kanaがひらがなの場合、有効である' do
    @recruiter.given_name_kana = 'かきくけこ'
    expect(@recruiter).to be_valid
  end

  it 'departmentが空欄の場合、無効である' do
    @recruiter.department = nil
    @recruiter.invalid?

    expect(@recruiter.errors[:department]).to include('を入力してください')
  end

  it 'telが空欄の場合、無効である' do
    @recruiter.tel = nil
    @recruiter.invalid?

    expect(@recruiter.errors[:tel]).to include('を入力してください')
  end

  it 'telがフォーマットから逸脱している場合、無効である' do
    @recruiter.tel = '022'
    @recruiter.invalid?

    expect(@recruiter.errors[:tel]).to include('はハイフンなしの10桁から11桁で入力してください')
  end
end
