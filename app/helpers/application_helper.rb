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

  def flash_output(key, value)
    content_tag(:p, value, class: "flash #{key}")
  end
end

# "<% if flash.present? %>
# <% flash.each do |key, value| %>
#   <p class="alert #{key}"><%= value %></p>
# <% end %>
# <% end %>"
