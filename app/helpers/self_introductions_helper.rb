module SelfIntroductionsHelper
  def self_introduction_path
    if request.path_info.include?('apealing_point')
      student_apealing_point_path
    elsif request.path_info.include?('apealing_image')
      student_apealing_image_path
    else
      request.path_info.include?('apealing_video')
      student_apealing_video_path
    end
  end
end
