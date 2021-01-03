require 'rails_helper'

RSpec.describe SelfIntroduction, type: :model do
  describe '自己PR機能' do
    before do
      @apealing_point = build(:apealing_point)
    end

    it 'typeカラムのデータは、ApealingPointである' do
      expect(@apealing_point.type).to eq 'ApealingPoint'
    end

    it '全ての情報が入力されている場合、有効である' do
      expect(@apealing_point).to be_valid
    end

    it 'titleが空欄の場合、無効である' do
      @apealing_point.title = nil
      @apealing_point.valid?

      expect(@apealing_point.errors[:title]).to include('を入力してください')
    end

    it 'titleが50文字を超える場合、無効である' do
      @apealing_point.title = 'a' * 51
      @apealing_point.valid?

      expect(@apealing_point.errors[:title]).to include('は50文字以内で入力してください')
    end

    it 'contentが空欄の場合、無効である' do
      @apealing_point.content = nil
      @apealing_point.valid?

      expect(@apealing_point.errors[:content]).to include('を入力してください')
    end

    it 'contentが500文字を超える場合、無効である' do
      @apealing_point.content = 'a' * 501
      @apealing_point.valid?

      expect(@apealing_point.errors[:content]).to include('は500文字以内で入力してください')
    end
  end

  describe '自己PR画像機能' do
    before do
      @apealing_image = build(:apealing_image)
      @apealing_image.image = fixture_file_upload("#{Rails.root}/tmp/test_image.png")
    end

    it 'typeカラムのデータは、ApealingImageである' do
      expect(@apealing_image.type).to eq 'ApealingImage'
    end

    it '全ての情報が入力されている場合、有効である' do
      expect(@apealing_image).to be_valid
    end

    it 'titleが空欄の場合、無効である' do
      @apealing_image.title = nil
      @apealing_image.valid?

      expect(@apealing_image.errors[:title]).to include('を入力してください')
    end

    it 'titleが50文字を超える場合、無効である' do
      @apealing_image.title = 'a' * 51
      @apealing_image.valid?

      expect(@apealing_image.errors[:title]).to include('は50文字以内で入力してください')
    end

    it 'contentが空欄の場合、無効である' do
      @apealing_image.content = nil
      @apealing_image.valid?

      expect(@apealing_image.errors[:content]).to include('を入力してください')
    end

    it 'contentが500文字を超える場合、無効である' do
      @apealing_image.content = 'a' * 501
      @apealing_image.valid?

      expect(@apealing_image.errors[:content]).to include('は500文字以内で入力してください')
    end

    it 'imageが5MBを超える場合、無効である' do
      @apealing_image.image = fixture_file_upload("#{Rails.root}/tmp/large_size_image.png")
      @apealing_image.valid?

      expect(@apealing_image.errors[:image]).to include('を5MB以下のサイズにしてください。')
    end

    it 'imageのファイル形式が(jpeg jpg png)以外の場合、無効である' do
      @apealing_image.image = fixture_file_upload("#{Rails.root}/tmp/false_filetype.gif")
      @apealing_image.valid?

      expect(@apealing_image.errors[:image]).to include('のファイル形式が不正です。')
    end
  end

  describe '自己PR動画機能' do
    before do
      @apealing_video = build(:apealing_video)
      @apealing_video.video = fixture_file_upload("#{Rails.root}/tmp/test_video.mp4")
    end

    it 'typeカラムのデータは、ApealingVideoである' do
      expect(@apealing_video.type).to eq 'ApealingVideo'
    end

    it '全ての情報が入力されている場合、有効である' do
      expect(@apealing_video).to be_valid
    end

    it 'titleが空欄の場合、無効である' do
      @apealing_video.title = nil
      @apealing_video.valid?

      expect(@apealing_video.errors[:title]).to include('を入力してください')
    end

    it 'titleが50文字を超える場合、無効である' do
      @apealing_video.title = 'a' * 51
      @apealing_video.valid?

      expect(@apealing_video.errors[:title]).to include('は50文字以内で入力してください')
    end

    it 'contentが空欄の場合、無効である' do
      @apealing_video.content = nil
      @apealing_video.valid?

      expect(@apealing_video.errors[:content]).to include('を入力してください')
    end

    it 'contentが500文字を超える場合、無効である' do
      @apealing_video.content = 'a' * 501
      @apealing_video.valid?

      expect(@apealing_video.errors[:content]).to include('は500文字以内で入力してください')
    end

    it 'videoが250MBを超える場合、無効である' do
      @apealing_video.video = fixture_file_upload("#{Rails.root}/tmp/large_size_video.mp4")
      @apealing_video.valid?
      expect(@apealing_video.errors[:video]).to include('を250MB以下のサイズにしてください。')
    end

    it 'videoのファイル形式が(jpeg jpg png)以外の場合、無効である' do
      @apealing_video.video = fixture_file_upload("#{Rails.root}/tmp/false_filetype.MOV")
      @apealing_video.valid?

      expect(@apealing_video.errors[:video]).to include('のファイル形式が不正です。')
    end
  end
end
