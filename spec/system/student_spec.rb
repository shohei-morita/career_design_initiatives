require 'rails_helper'

RSpec.describe 'Student', type: :system do
  describe 'サインイン機能' do
    before do
      visit new_student_registration_path
    end

    context 'アカウント登録画面にアクセスした場合' do
      it '「アカウント登録」の文字列が存在することを確認' do
        expect(page).to have_content('アカウント登録')
      end
    end

    context '必要情報を入力の上、アカウント登録ボタンを押した場合' do
      it 'アカウント登録後のページに遷移する' do
        fill_in 'Email', with: 'test_student@test.com'
        select '2021', from: 'Graduation year'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_on 'アカウント登録'

        expect(page).to have_content('ようこそ')
      end
    end

    describe 'ログイン機能' do
      before do
        Student.create!(email: 'test@test.mail', graduation_year: 0, password: 'password')
      end

      context 'ログイン画面にアクセスした場合' do
        it '「ログイン」の文字列が存在すること確認' do
          expect(page).to have_content('ログイン')
        end
      end

      context 'ログイン情報を入力の上、ログインボタンを押した場合' do
        it 'ログイン後ページに遷移する' do
          visit new_student_session_path
          fill_in 'Email', with: 'test@test.mail'
          fill_in 'Password', with: 'password'
          click_button 'ログイン'

          expect(page).to have_content('ようこそ')
        end
      end
    end
  end
end
