require 'rails_helper'

RSpec.describe JobInformation, type: :model do
  before do
    @job_information = build(:job_information)
  end

  it '情報が全て入力されている場合、有効である' do
    expect(@job_information).to be_valid
  end

  it 'titleが空欄の場合、無効である' do
    @job_information.title = nil
    @job_information.valid?

    expect(@job_information.errors[:title]).to include('を入力してください')
  end

  it 'titleが51文字以上の場合、無効である' do
    @job_information.title = 'a' * 51
    @job_information.valid?

    expect(@job_information.errors[:title]).to include('は50文字以内で入力してください')
  end

  it 'contentが空欄の場合、無効である' do
    @job_information.content = nil
    @job_information.valid?

    expect(@job_information.errors[:content]).to include('を入力してください')
  end

  it 'contentが1001文字以上の場合、無効である' do
    @job_information.content = 'a' * 1001
    @job_information.valid?

    expect(@job_information.errors[:content]).to include('は1000文字以内で入力してください')
  end

  it 'payが空欄の場合、無効である' do
    @job_information.pay = nil
    @job_information.valid?

    expect(@job_information.errors[:pay]).to include('を入力してください')
  end

  it 'payが101文字以上の場合、無効である' do
    @job_information.pay = 'a' * 101
    @job_information.valid?

    expect(@job_information.errors[:pay]).to include('は100文字以内で入力してください')
  end

  it 'working_statusが空欄の場合、無効である' do
    @job_information.working_status = nil
    @job_information.valid?

    expect(@job_information.errors[:working_status]).to include('を入力してください')
  end

  it 'working_statusが101文字以上の場合、無効である' do
    @job_information.working_status = 'a' * 101
    @job_information.valid?

    expect(@job_information.errors[:working_status]).to include('は100文字以内で入力してください')
  end

  it 'working_hourが空欄の場合、無効である' do
    @job_information.working_hour = nil
    @job_information.valid?

    expect(@job_information.errors[:working_hour]).to include('を入力してください')
  end

  it 'working_hourが101文字以上の場合、無効である' do
    @job_information.working_hour = 'a' * 101
    @job_information.valid?

    expect(@job_information.errors[:working_hour]).to include('は100文字以内で入力してください')
  end

  it 'benefitが空欄の場合、無効である' do
    @job_information.benefit = nil
    @job_information.valid?

    expect(@job_information.errors[:benefit]).to include('を入力してください')
  end

  it 'benefitが201文字以上の場合、無効である' do
    @job_information.benefit = 'a' * 201
    @job_information.valid?

    expect(@job_information.errors[:benefit]).to include('は200文字以内で入力してください')
  end

  it 'day_offが空欄の場合、無効である' do
    @job_information.day_off = nil
    @job_information.valid?

    expect(@job_information.errors[:day_off]).to include('を入力してください')
  end

  it 'day_offが151文字以上の場合、無効である' do
    @job_information.day_off = 'a' * 151
    @job_information.valid?

    expect(@job_information.errors[:day_off]).to include('は150文字以内で入力してください')
  end

  it 'selectionが空欄の場合、無効である' do
    @job_information.selection = nil
    @job_information.valid?

    expect(@job_information.errors[:selection]).to include('を入力してください')
  end

  it 'selectionが500文字以上の場合、無効である' do
    @job_information.selection = 'a' * 501
    @job_information.valid?

    expect(@job_information.errors[:selection]).to include('は500文字以内で入力してください')
  end

  it 'workplace_detailが200文字以上の場合、無効である' do
    @job_information.workplace_detail = 'a' * 201
    @job_information.valid?

    expect(@job_information.errors[:workplace]).to include('は200文字以内で入力してください')
  end

  it 'statusが空欄の場合、無効である' do
    @job_information.status = nil
    @job_information.valid?

    expect(@job_information.errors[:status]).to include('を選択してください')
  end
end
