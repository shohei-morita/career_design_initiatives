require 'rails_helper'

RSpec.describe Student, type: :model do
  before do
    @student = build(:student)
  end

  describe 'バリデーション' do
    it 'メールアドレス、卒業年度、パスワードが入力されている場合、有効である' do
      expect(@student).to be_valid
    end

    it 'メールアドレスがない場合無効である' do
      @student.email = nil
      @student.valid?

      expect(@student.errors[:email]).to include('を入力してください')
      expect(@student.errors[:email]).to include('は不正な値です')
    end

    it '卒業年度がない場合無効である' do
      @student.graduation_year = nil
      @student.valid?

      expect(@student.errors[:graduation_year]).to include('を入力してください')
    end

    it 'パスワードがない場合無効である' do
      @student.password = nil
      @student.valid?

      expect(@student.errors[:password]).to include('を入力してください')
      expect(@student.errors[:password]).to include('は6文字以上で入力してください')
    end
  end
end
