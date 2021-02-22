require 'rails_helper'

RSpec.describe 'scout機能', type: :system do
  describe 'scout送信' do
    let!(:approved_recruiter) { create(:recruiter, :approved_recruiter) }
    let!(:company) { create(:company, recruiter: approved_recruiter) }

    before do
      login_as approved_recruiter
      visit search_student_recruiters_path
    end

    context '生徒検索画面にアクセスした場合' do
      it '対象生徒を検索して、スカウトを送ることができる' do

        fill_in 'q[educational_background_school_name_or_extracurricular_activities_name_or_extracurricular_activities_summary_or_awards_title_or_awards_summary_or_apealing_point_title_or_apealing_point_content_or_apealing_video_content_or_apealing_video_title_or_apealing_image_title_or_apealing_image_content_or_qualification_qualification_1st_or_qualification_qualification_2nd_or_qualification_qualification_3rd_or_qualification_qualification_4th_or_qualification_qualification_5th_cont]', with: '野球部2'
        click_button 'この条件で検索'

        expect(page).to have_content('test&example3')

        click_link 'スカウト'

        fill_in 'scout[title]', with: 'こんにちは'
        fill_in 'scout[scout_messages_attributes][0][content]', with: 'ようこそブラック企業へ'
        select 'job_1', from: 'scout[job_information_ids][]'

        click_button '送信'

        expect(page).to have_content('メッセージ一覧')
        expect(page).to have_content('test&example3')
        expect(page).to have_content('こんにちは')

        click_on '詳細'

        expect(page).to have_content('こんにちは')
        expect(page).to have_content('ようこそブラック企業へ')
        expect(page).to have_content('job_1')
      end
    end
  end
end
