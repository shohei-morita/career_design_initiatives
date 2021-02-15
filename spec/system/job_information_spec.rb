require 'rails_helper'

RSpec.describe 'job_information機能', type: :system do
  describe 'job_information登録機能' do
    let!(:approved_recruiter) { create(:recruiter, :approved_recruiter) }
    let!(:company) { create(:company, recruiter: approved_recruiter) }

    before do
      login_as approved_recruiter
      visit recruiter_job_informations_path(approved_recruiter.id)
    end

    context '求人情報の登録・管理画面にアクセスした場合' do
      it '登録求人一覧が確認できる' do
        expect(page).to have_content('job_', count: 5)
        expect(page).to have_content('準備中', count: 6)
      end

      it '新規求人登録を選択して、求人情報を登録できる' do
        click_link '新規求人登録'

        fill_in 'job_information[title]', with: 'ブラック企業へようこそ'
        fill_in 'job_information[content]', with: '追い出し部屋の管理職候補'
        fill_in 'job_information[appealing_point]', with: '3年後退職率85%'
        fill_in 'job_information[pay]', with: '100,000円／月の高待遇'
        fill_in 'job_information[working_status]', with: '正社員'
        fill_in 'job_information[working_hour]', with: '7:00〜23:00（休憩なし）'
        fill_in 'job_information[benefit]', with: '特になし'
        fill_in 'job_information[day_off]', with: '特になし'
        fill_in 'job_information[selection]', with: '面接なし'
        fill_in 'job_information[workplace_detail]', with: 'どこでも'
        select '準備中', from: 'job_information[status]'

        click_button '保存'

        expect(page).to have_content('準備中求人')
        expect(page).to have_content('準備中')
        expect(page).to have_content('ブラック企業へようこそ')
        expect(page).to have_content('追い出し部屋の管理職候補')
      end

      it '確認を押して、編集ができる' do
        click_link '確認', match: :first

        fill_in 'job_information[title]', with: 'ブラック企業へようこそ'
        fill_in 'job_information[content]', with: '追い出し部屋の管理職候補'
        fill_in 'job_information[appealing_point]', with: '3年後退職率85%'
        fill_in 'job_information[pay]', with: '100,000円／月の高待遇'
        fill_in 'job_information[working_status]', with: '正社員'
        fill_in 'job_information[working_hour]', with: '7:00〜23:00（休憩なし）'
        fill_in 'job_information[benefit]', with: '特になし'
        fill_in 'job_information[day_off]', with: '特になし'
        fill_in 'job_information[selection]', with: '面接なし'
        fill_in 'job_information[workplace_detail]', with: 'どこでも'
        select '公開中', from: 'job_information[status]'

        click_button '保存'

        expect(page).to have_content('公開中求人')
        expect(page).to have_content('ブラック企業へようこそ')
        expect(page).to have_content('追い出し部屋の管理職候補')
      end

      it '任意の求人を削除できる' do
        click_link '求人削除', match: :first

        expect do
          page.accept_confirm '本当に削除しますか？'
          expect(page).to have_content '求人情報を削除'
        end.to change { JobInformation.count }.by(-1)
      end
    end
  end
end
