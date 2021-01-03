require 'rails_helper'

RSpec.describe 'PR機能', type: :system do
  let!(:student) { create(:student) }

  describe '自己PR登録・編集機能' do
    context 'PR画面から自己PR登録を選択した場合' do
      it '自己PR情報を登録できるテスト' do
        login_as student
        visit pr_students_path

        click_link '自己PR登録'

        fill_in 'apealing_point[title]', with: '朝の挨拶'
        fill_in 'apealing_point[content]', with: 'おはよう'
        click_on '登録'

        expect(page).to have_content('自己PR詳細')
        expect(page).to have_content('朝の挨拶')
        expect(page).to have_content('おはよう')
      end
    end

    context 'PR画面から自己PRを選択した場合' do
      let!(:apealing_point) { create(:apealing_point, student_id: student.id) }
      it '自己PR情報が確認できるテスト' do
        login_as student
        visit pr_students_path

        click_link '自己PR'

        expect(page).to have_content('自己PR詳細')
        expect(page).to have_content('アピールポイント')
        expect(page).to have_content('特にありません')
      end

      it '自己PR情報が編集できるテスト' do
        login_as student
        visit edit_student_apealing_point_path(student.id)

        fill_in 'apealing_point[title]', with: 'アピールポイントではない'
        fill_in 'apealing_point[content]', with: '特にないわけではない'
        click_on '更新'

        expect(page).to have_content('アピールポイントではない')
        expect(page).to have_content('特にないわけではない')
      end
    end
  end

  describe '自己PR画像登録・編集機能' do
    context 'PR画面から自己PR画像登録を選択した場合' do
      it '自己PR画像情報を登録できるテスト' do
        login_as student
        visit pr_students_path

        click_link '自己PR画像登録'

        attach_file 'アピール画像', "#{Rails.root}/tmp/test_image.png"
        fill_in 'apealing_image[title]', with: '昼の挨拶'
        fill_in 'apealing_image[content]', with: 'こんにちは'
        click_on '登録'

        expect(page).to have_content('自己PR画像詳細')
        expect(page).to have_selector("img[src$='test_image.png']")
        expect(page).to have_content('昼の挨拶')
        expect(page).to have_content('こんにちは')
      end
    end

    context 'PR画面から自己PR画像を選択した場合' do
      let!(:apealing_image) { create(:apealing_image, student_id: student.id) }

      it '自己PR画像情報が確認できるテスト' do
        login_as student
        visit pr_students_path

        click_link '自己PR画像'

        expect(page).to have_content('自己PR画像詳細')
        expect(page).to have_selector("img[src$='test_image.png']")
        expect(page).to have_content('アピール画像')
        expect(page).to have_content('特にありません')
      end

      it '自己PR画像情報が編集できるテスト' do
        login_as student
        visit edit_student_apealing_image_path(student.id)

        fill_in 'apealing_image[title]', with: 'アピール画像ではない'
        fill_in 'apealing_image[content]', with: '特にないわけではない2'
        click_on '更新'

        expect(page).to have_content('アピール画像ではない')
        expect(page).to have_content('特にないわけではない2')
      end
    end
  end

  describe '自己PR動画登録・編集機能' do
    context 'PR画面から自己PR動画登録を選択した場合' do
      it '自己PR動画情報を登録できるテスト' do
        login_as student
        visit pr_students_path

        click_link '自己PR動画登録'

        attach_file 'アピール動画', "#{Rails.root}/tmp/test_video.mp4"
        fill_in 'apealing_video[title]', with: '夜の挨拶'
        fill_in 'apealing_video[content]', with: 'こんばんは'
        click_on '登録'

        expect(page).to have_content('自己PR動画詳細')
        expect(page).to have_content('夜の挨拶')
        expect(page).to have_content('こんばんは')
      end
    end

    context 'PR画面から自己PR動画を選択した場合' do
      let!(:apealing_video) { create(:apealing_video, student_id: student.id) }

      it '自己PR動画情報が確認できるテスト' do
        login_as student
        visit pr_students_path

        click_link '自己PR動画'

        expect(page).to have_content('自己PR動画詳細')
        expect(page).to have_selector("video[src$='test_video.mp4']")
        expect(page).to have_content('アピール動画')
        expect(page).to have_content('特にありません')
      end

      it '自己PR動画情報が編集できるテスト' do
        login_as student
        visit edit_student_apealing_video_path(student.id)

        fill_in 'apealing_video[title]', with: 'アピール動画ではない'
        fill_in 'apealing_video[content]', with: '特にないわけではない3'
        click_on '更新'

        expect(page).to have_content('アピール動画ではない')
        expect(page).to have_content('特にないわけではない3')
      end
    end
  end
end
