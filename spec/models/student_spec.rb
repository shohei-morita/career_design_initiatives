require 'rails_helper'

RSpec.describe Student, type: :model do
  before do
    @student = build(:student)
  end

  it '全ての情報が入力されている場合、有効である' do
    expect(@student).to be_valid
  end

  it 'emailがない場合無効である' do
    @student.email = nil
    @student.valid?

    expect(@student.errors[:email]).to include('を入力してください')
  end

  it 'emailが重複している場合無効である' do
    student = create(:student)
    another_student = build(:student, email: student.email)
    another_student.valid?

    expect(another_student.errors[:email]).to include('はすでに存在します')
  end

  it 'graduation_yearがない場合無効である' do
    @student.graduation_year = nil
    @student.valid?

    expect(@student.errors[:graduation_year]).to include('を入力してください')
  end

  it 'passwordがない場合無効である' do
    @student.password = nil
    @student.valid?

    expect(@student.errors[:password]).to include('を入力してください')
  end

  it 'passwordとpassword_confirmationが一致しない場合無効である' do
    @student.password_confirmation = 'password2'
    @student.valid?

    expect(@student.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
  end

  it 'family_name_kanaは平仮名である場合は有効である' do
    student = create(:student, family_name_kana: 'さんぷる')
    expect(student.family_name_kana).to eq 'サンプル'
  end

  it 'given_name_kanaは平仮名である場合は有効である' do
    student = create(:student, given_name_kana: 'さんぷる')
    expect(student.given_name_kana).to eq 'サンプル'
  end

  it 'family_name_kanaがカタカナもしくは平仮名でない場合は無効である' do
    @student.family_name_kana = '合鴨農法'
    @student.valid?

    expect(@student.errors[:family_name_kana]).to include('はカタカナもしくはひらがなで入力して下さい')
  end

  it 'given_name_kanaがカタカナもしくは平仮名でない場合は無効である' do
    @student.given_name_kana = '合鴨農法'
    @student.valid?

    expect(@student.errors[:given_name_kana]).to include('はカタカナもしくはひらがなで入力して下さい')
  end
end
