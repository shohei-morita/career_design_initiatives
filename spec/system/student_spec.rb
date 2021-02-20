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
        fill_in 'student[email]', with: 'test_student@test.com'
        select '2021', from: 'student[graduation_year]'
        fill_in 'student[password]', with: 'password'
        fill_in 'student[password_confirmation]', with: 'password'
        click_on '登録'

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
        fill_in 'student[email]', with: student.email
        fill_in 'student[password]', with: student.password
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

        attach_file 'student[avatar]', "#{Rails.root}/tmp/test_image.png"
        fill_in 'student[email]', with: 'test02@test.email'
        fill_in 'student[tel]', with: '09099991111'
        fill_in 'student[family_name]', with: 'さんぷる1'
        fill_in 'student[given_name]', with: 'はなこ'
        fill_in 'student[family_name_kana]', with: 'サンプルイチ'
        fill_in 'student[given_name_kana]', with: 'ハナコ'
        fill_in 'student[nickname]', with: 'サンプルの女帝'
        fill_in 'student[birth_date]', with: '002002-04-02'
        fill_in 'student[address]', with: '富山県富山市'
        select '女性', from: 'student[gender]'
        find('.first-accordion').click
        check '金融・保険'
        find('.second-accordion').click
        check '経営・経営企画・事業企画系'
        find('.third-accordion').click
        check 'テレワーク可'
        check '家族手当あり'
        find('.fourth-accordion').click
        check '北海道'

        click_on '更新'

        expect(page).to have_selector("img[src$='test_image.png']")
        expect(page).to have_content('test02@test.email')
        expect(page).to have_content('さんぷる1')
        expect(page).to have_content('はなこ')
        expect(page).to have_content('サンプルイチ')
        expect(page).to have_content('ハナコ')
        expect(page).to have_content('サンプルの女帝')
        expect(page).to have_content('2002-04-02')
        expect(page).to have_content('09099991111')
        expect(page).to have_content('女性')
        expect(page).to have_content('金融・保険')
        expect(page).to have_content('経営・経営企画・事業企画系')
        expect(page).to have_content('テレワーク可')
        expect(page).to have_content('家族手当あり')
        expect(page).to have_content('北海道')
      end
    end
  end
end
