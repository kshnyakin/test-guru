# frozen_string_literal: true

class GitHubClient
  def initialize
    @client = Octokit::Client.new(bearer_token: ENV['OCTOKIT_TEST_GITHUB_TOKEN'])
  end

  def create_gist(params)
    @client.create_gist(params.to_json)
  end
end
