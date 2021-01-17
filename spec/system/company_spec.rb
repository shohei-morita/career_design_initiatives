require 'rails_helper'

RSpec.describe 'company機能', type: :system do
  describe 'company編集機能' do
    let!(:approved_recruiter) { create(:recruiter, :approved_recruiter) }
    let!(:company) { create(:company, recruiter: approved_recruiter) }
    before do
      login_as approved_recruiter
      visit settings_recruiters_path
    end
    context '各種設定から登録企業情報にアクセスした場合' do
      it '登録企業情報を確認できる' do
        click_link '企業情報'

        expect(page).to have_content company.name
        expect(page).to have_content company.president_name
        expect(page).to have_content company.capital
        expect(page).to have_content company.revenue
        expect(page).to have_content company.number_of_employees
        expect(page).to have_content company.business_outline
        expect(page).to have_content company.url
      end

      it '登録企業情報を編集できる' do
        click_link '企業情報'

        click_link '企業情報編集'

        fill_in 'company[number_of_employees]', with: '450人(2022年度)'
        fill_in 'company[revenue]', with: '500億円(2022年度)'
        fill_in 'company[url]', with: 'www.url.co.jp'
        fill_in 'company[business_outline]', with: '廃業間近です'

        click_button '更新'

        expect(page).to have_content('450人(2022年度)')
        expect(page).to have_content('500億円(2022年度)')
        expect(page).to have_content('www.url.co.jp')
        expect(page).to have_content('廃業間近です')
      end
    end
  end
end
