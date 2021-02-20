module JobInformationHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      recruiter_job_information_index_path
    elsif action_name == 'edit'
      recruiter_job_information_path
    end
  end
end
