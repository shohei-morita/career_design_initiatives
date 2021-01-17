require 'rails_helper'

RSpec.describe 'recruiter機能', type: :system do
  describe 'アカウント申請機能' do
    let!(:admin_recruiter) { create(:recruiter, :admin) }
    context '企業新規登録画面にアクセスした場合' do
      it '必要情報を入力して申請した場合、確認画面に遷移し、そこから申請ボタンを押せば申請が完了するテスト' do
        visit new_recruiter_registration_path

        fill_in 'recruiter[company_attributes][name]', with: '△△株式会社'
        select_year('2018', from: '設立年')
        fill_in 'recruiter[company_attributes][capital]', with: '10億円'
        fill_in 'recruiter[company_attributes][president_name]', with: '山田太郎'
        fill_in 'recruiter[company_attributes][number_of_employees]', with: '500人（2021年1月31日現在）'
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

        click_on '申請'

        expect(page).to have_content('△△株式会社')
        expect(page).to have_content('10億円')
        expect(page).to have_content('2018')
        expect(page).to have_content('500人（2021年1月31日現在）')
        expect(page).to have_content('山田太郎')
        expect(page).to have_content('www.url.com')
        expect(page).to have_content('総務部')
        expect(page).to have_content('部長')
        expect(page).to have_content('田中 太郎')
        expect(page).to have_content('タナカ タロウ')
        expect(page).to have_content('test@mail.com')
        expect(page).to have_content('090-949-3022')
        expect(page).to have_content('090-949-3023')

        click_on '申請'

        expect(page).to have_content('ユーザー申請が完了しました')
        expect(page).to have_content('承認後メールが届きますので、今しばらくお待ちください')
      end

      it '管理者が管理画面から申請を承認し、アカウントをメールで通知できるテスト' do
        visit new_recruiter_registration_path

        fill_in 'recruiter[company_attributes][name]', with: '△△株式会社'
        select_year('2018', from: '設立年')
        fill_in 'recruiter[company_attributes][capital]', with: '10億円'
        fill_in 'recruiter[company_attributes][president_name]', with: '山田太郎'
        fill_in 'recruiter[company_attributes][number_of_employees]', with: '500人（2021年1月31日現在）'
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

        click_on '申請'
        click_on '申請'

        login_as admin_recruiter

        expect(page).to have_content('△△株式会社')
        expect(page).to have_content('総務部')
        expect(page).to have_content('部長')
        expect(page).to have_content('田中 太郎')
        expect(page).to have_content('test@mail.com')
        expect(page).to have_content('未承認')

        click_link '確認', match: :first
        click_button '承認'
        click_button 'Back'

        expect(page).to_not have_content('未承認')
        expect(page).to have_content('承認')

        sent_mail = ActionMailer::Base.deliveries.last

        expect(sent_mail.subject).to eq('アカウントが承認されました')
        expect(sent_mail.html_part.body.to_s).to include('△株式会社 田中太郎')
        expect(sent_mail.html_part.body.to_s).to include('あなたのパスワードは')
      end
    end
  end

  describe 'ログイン機能' do
    let!(:recruiter) { create(:recruiter) }
    let!(:approved_recruiter) { create(:recruiter, :approved_recruiter) }
    let!(:company) { create(:company, recruiter: approved_recruiter) }
    context 'ログインページにアクセスした場合' do
      it 'approvedがfalseの場合、ログインできない' do
        visit new_recruiter_session_path

        fill_in 'recruiter[email]', with: recruiter.email
        fill_in 'recruiter[password]', with: recruiter.password

        click_button 'ログイン'

        expect(page).to have_content('アカウントがまだ承認されていません')
      end

      it 'メールアドレスとパスワードを入力の上、ログインすることができる' do
        visit new_recruiter_session_path
        fill_in 'recruiter[email]', with: approved_recruiter.email
        fill_in 'recruiter[password]', with: approved_recruiter.password

        click_button 'ログイン'

        expect(page).to have_content('○○株式会社')
      end
    end
  end

  describe '担当者情報編集機能' do
    let!(:approved_recruiter) { create(:recruiter, :approved_recruiter) }
    let!(:company) { create(:company, recruiter: approved_recruiter) }
    before do
      login_as approved_recruiter
      visit settings_recruiters_path
    end
    context '各種設定から担当者情報にアクセスした場合' do
      it '担当者情報を確認できる' do
        click_link '担当者情報'

        expect(page).to have_content approved_recruiter.department
        expect(page).to have_content approved_recruiter.title
        expect(page).to have_content approved_recruiter.family_name
        expect(page).to have_content approved_recruiter.given_name
        expect(page).to have_content approved_recruiter.family_name_kana
        expect(page).to have_content approved_recruiter.given_name_kana
        expect(page).to have_content approved_recruiter.email
        expect(page).to have_content approved_recruiter.tel
        expect(page).to have_content approved_recruiter.fax
      end

      it '担当者情報を編集できる' do
        click_link '担当者情報'
        click_link '担当者情報編集'

        attach_file 'recruiter[avatar]', "#{Rails.root}/tmp/test_image.png"
        fill_in 'recruiter[department]', with: '人事部'
        fill_in 'recruiter[title]', with: '課長'
        fill_in 'recruiter[family_name]', with: '山下'
        fill_in 'recruiter[given_name]', with: '一郎'
        fill_in 'recruiter[family_name_kana]', with: 'ヤマシタ'
        fill_in 'recruiter[given_name_kana]', with: 'イチロウ'
        fill_in 'recruiter[email]', with: 'jinji@mail.com'
        fill_in 'recruiter[tel]', with: '090-900-1111'
        fill_in 'recruiter[fax]', with: '090-900-1122'

        click_button '変更'

        expect(page).to have_selector("img[src$='test_image.png']")
        expect(page).to have_content('人事部')
        expect(page).to have_content('課長')
        expect(page).to have_content('山下')
        expect(page).to have_content('一郎')
        expect(page).to have_content('ヤマシタ')
        expect(page).to have_content('イチロウ')
        expect(page).to have_content('jinji@mail.com')
        expect(page).to have_content('090-900-1111')
        expect(page).to have_content('090-900-1122')
      end

      it 'パスワードを変更できる' do
        click_link 'パスワード変更'

        fill_in 'recruiter[password]', with: 'new_password'
        fill_in 'recruiter[password_confirmation]', with: 'new_password'
        fill_in 'recruiter[current_password]', with: approved_recruiter.password

        click_button '変更'

        expect(page).to have_content('アカウント情報を変更しました')
      end
    end
  end
end
