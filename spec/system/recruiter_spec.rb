require 'rails_helper'

RSpec.describe 'recruiter機能', type: :system do
  describe 'アカウント申請機能' do
    context '企業新規登録画面にアクセスした場合' do
      it '必要情報を入力して、アカウント申請をすることができる' do
        visit new_recruiter_registration_path

        fill_in 'recruiter[company_attributes][name]', with: '△△株式会社'
        select_year('2018', from: '設立年')
        fill_in 'recruiter[company_attributes][capital]', with: '10億円'
        fill_in 'recruiter[company_attributes][president_name]', with: '山田太郎'
        fill_in 'recruiter[company_attributes][capital]', with: '1000'
        fill_in 'recruiter[company_attributes][url]', with: 'www.url.com'
        fill_in 'recruiter[department]', with: '総務部'
        fill_in 'recruiter[title]', with: '部長'
        fill_in 'recruiter[family_name]', with: '田中'
        fill_in 'recruiter[given_name]', with: '太郎'
        fill_in 'recruiter[family_name_kana]', with: 'タナカ'
        fill_in 'recruiter[given_name_kana]', with: 'タロウ'
        fill_in 'recruiter[email]', with: 'test@mail.com'
        fill_in 'recruiter[tel]', with: '090-949-3022'
        fill_in 'recruiter[fax]', with: '090-949-3023'
      end
    end
  end
end
