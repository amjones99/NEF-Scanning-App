#Environment_Notice_helper is a ruby helper used to extract complex logic out of the view in order to organize EnvironmentNotice code better.

module EnvironmentNoticeHelper

  def display_environment_notice?
    !Rails.env.to_sym.in?([:production, :development, :test])
  end

  def environment_notice_body_class
    display_environment_notice? ? 'has-environment-notice' : ''
  end

end
