# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_link(author, repo)
    link_to repo,
            "https://github.com/#{author}/#{repo}",
            target: '_blank',
            rel: 'nofollow noopener'
  end

  def flash_alert(flash)
    return unless flash[:alert]

    content_tag(:p, flash[:alert], class: 'flash alert')
  end
end
