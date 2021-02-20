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
        fill_in 'recruiter[tel]', with: '0909493022'
        fill_in 'recruiter[fax]', with: '0909493023'

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
        expect(page).to have_content('0909493022')
        expect(page).to have_content('0909493023')

        click_on '申請'

        expect(page).to have_content('アカウント申請を受け付けました。')
        expect(page).to have_content('承認されましたら、ログイン情報が登録メールにて届きます。')
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
        fill_in 'recruiter[tel]', with: '0909493022'
        fill_in 'recruiter[fax]', with: '0909493023'

        click_on '申請'
        click_on '申請'

        login_as admin_recruiter

        visit admin_recruiters_path

        click_on '確認'

        expect(page).to have_content('△△株式会社')
        expect(page).to have_content('総務部')
        expect(page).to have_content('部長')
        expect(page).to have_content('田中 太郎')
        expect(page).to have_content('test@mail.com')
        expect(page).to have_content('未承認')

        click_button '承認'
        click_link '検索結果に戻る'

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

    let!(:suspended_recruiter) { create(:recruiter, :suspended_recruiter) }

    context 'ログインページにアクセスした場合' do
      it 'approvedがfalseの場合、ログインできない' do
        visit new_recruiter_session_path

        fill_in 'recruiter[email]', with: recruiter.email
        fill_in 'recruiter[password]', with: recruiter.password

        click_button 'ログイン'

        expect(page).to have_content('アカウントが未承認か、凍結されています')
      end

      it 'approvedがtrueの場合、メールアドレスとパスワードを入力の上、ログインすることができる' do
        visit new_recruiter_session_path
        fill_in 'recruiter[email]', with: approved_recruiter.email
        fill_in 'recruiter[password]', with: approved_recruiter.password

        click_button 'ログイン'

        expect(page).to have_content('ログインしました')
      end

      it 'suspendedがtrueの場合、メールアドレスとパスワードを入力しても、ログインできない' do
        visit new_recruiter_session_path
        fill_in 'recruiter[email]', with: suspended_recruiter.email
        fill_in 'recruiter[password]', with: suspended_recruiter.password

        click_button 'ログイン'

        expect(page).to have_content('アカウントが未承認か、凍結されています')
      end
    end
  end

  describe '関係情報編集機能' do
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
        click_link '編集'

        fill_in 'recruiter[department]', with: '人事部'
        fill_in 'recruiter[title]', with: '課長'
        fill_in 'recruiter[family_name]', with: '山下'
        fill_in 'recruiter[given_name]', with: '一郎'
        fill_in 'recruiter[family_name_kana]', with: 'ヤマシタ'
        fill_in 'recruiter[given_name_kana]', with: 'イチロウ'
        fill_in 'recruiter[email]', with: 'jinji@mail.com'
        fill_in 'recruiter[tel]', with: '0909001111'
        fill_in 'recruiter[fax]', with: '0909001122'

        click_button '変更'

        expect(page).to have_content('人事部')
        expect(page).to have_content('課長')
        expect(page).to have_content('山下')
        expect(page).to have_content('一郎')
        expect(page).to have_content('ヤマシタ')
        expect(page).to have_content('イチロウ')
        expect(page).to have_content('jinji@mail.com')
        expect(page).to have_content('0909001111')
        expect(page).to have_content('0909001122')
      end
    end

    context '各種設定から企業情報にアクセスした場合' do
      it '企業情報を確認できる' do
        click_link '企業情報'

        expect(page).to have_content('○○株式会社')
        expect(page).to have_content('2015')
        expect(page).to have_content('山田太郎')
        expect(page).to have_content('500万円')
        expect(page).to have_content('5億円（2020年度）')
        expect(page).to have_content('500人')
        expect(page).to have_content('人材紹介サービス')
        expect(page).to have_content('www.url.com')
      end

      it '企業情報を編集できる' do
        click_link '企業情報'
        click_link '編集'

        fill_in 'company[number_of_employees]', with: '400人'
        fill_in 'company[business_outline]', with: '特にありません'
        fill_in 'company[revenue]', with: '4億円（2021年度）'
        fill_in 'company[url]', with: 'www.ttt.com'
        find('.first-accordion').click
        check '金融・保険'

        click_button '更新'

        expect(page).to have_content('400人')
        expect(page).to have_content('特にありません')
        expect(page).to have_content('4億円（2021年度')
        expect(page).to have_content('www.ttt.com')
        expect(page).to have_content('金融・保険')
      end
    end


    context '各種設定からパスワード変更にアクセスした場合' do
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
