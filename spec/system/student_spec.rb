require 'rails_helper'

RSpec.describe 'student機能', type: :system do
  let!(:student) { create(:student) }

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
  end

  describe 'ログイン機能' do
    context 'ログイン画面にアクセスした場合' do
      it '「ログイン」の文字列が存在すること確認' do
        visit new_student_session_path
        expect(page).to have_content('ログイン')
      end
    end

    context 'ログイン情報を入力の上、ログインボタンを押した場合' do
      it 'ログイン後ページに遷移する' do
        visit new_student_session_path
        fill_in 'Email', with: student.email
        fill_in 'Password', with: student.password
        click_button 'ログイン'

        expect(page).to have_content('ようこそ')
      end
    end
  end

  describe 'student情報編集機能' do
    context 'HOME画面からPROFILEを選択した場合' do
      it '基本情報の文字列が存在することを確認' do
        login_as student
        click_link 'PROFILE'

        expect(page).to have_content('基本情報')
      end
    end

    context '基本情報のリンクをクリックした場合' do
      it '基本情報詳細確認画面に遷移するテスト' do
        login_as student
        visit profile_students_path

        click_link '基本情報'
        expect(page).to have_content('test01@test.email')
        expect(page).to have_content('さんぷる')
        expect(page).to have_content('たろう')
        expect(page).to have_content('サンプル')
        expect(page).to have_content('タロウ')
        expect(page).to have_content('サンプルの帝王')
        expect(page).to have_content('2001-05-01')
        expect(page).to have_content('090-9999-8888')
        expect(page).to have_content('男性')
      end
    end

    context '基本情報詳細画面から編集をクリックした場合' do
      it '既存情報を変更して、情報を更新できるテスト' do
        login_as student
        visit edit_student_registration_path

        attach_file 'Avatar', "#{Rails.root}/tmp/test_image.png"
        fill_in 'Email', with: 'test02@test.email'
        fill_in 'Tel', with: '090-9999-1111'
        fill_in 'Family name', with: 'さんぷる1'
        fill_in 'Given name', with: 'はなこ'
        fill_in 'Family name kana', with: 'サンプルイチ'
        fill_in 'Given name kana', with: 'ハナコ'
        fill_in 'Nickname', with: 'サンプルの女帝'
        select_date('2002,4,2', from: 'Birth date')
        select '女性', from: 'Gender'

        click_on '更新'

        expect(page).to have_selector("img[src$='test_image.png']")
        expect(page).to have_content('test02@test.email')
        expect(page).to have_content('さんぷる1')
        expect(page).to have_content('はなこ')
        expect(page).to have_content('サンプルイチ')
        expect(page).to have_content('ハナコ')
        expect(page).to have_content('サンプルの女帝')
        expect(page).to have_content('2002-04-02')
        expect(page).to have_content('090-9999-1111')
        expect(page).to have_content('女性')
      end
    end
  end
end
