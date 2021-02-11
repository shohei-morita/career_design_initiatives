class Notification < ApplicationRecord

  def path_info
    case action
    when 'scout'
      if Scout.find_by(id: action_id).present?
        "/scouts/"
      else
        "/"
      end
    when 'scoutmessage'
      if ScoutMessage.find_by(id: action_id).present?
        "/scouts/#{ScoutMessage.find_by(id: action_id).scout_id}/scout_messages"
      else
        "/"
      end
    end
  end

  def new_message
    case action
    when 'scout'
      if Scout.find_by(id: action_id).present?
        "#{Scout.find_by(id: action_id).recruiter.company.name}からスカウトが届いています"
      else
        "メッセージはありません"
      end
    when 'scoutmessage'
      if object == 'student'
        "#{ScoutMessage.find_by(id: action_id).scout.recruiter.company.name}からメッセージが届いています"
      elsif object == 'recruiter'
        unless ScoutMessage.find_by(id: action_id).scout.student.nickname.nil?
          "#{ScoutMessage.find_by(id: action_id).scout.student.nickname}さんからメッセージが届いています"
        else
          "ID#{ScoutMessage.find_by(id: action_id).scout.student.id}さんからメッセージが届いています"
        end
      else
        "メッセージはありません"
      end
    end
  end

  def message_time
    created_at.strftime('%m/%d/%y at %l:%M %p')
  end
end
