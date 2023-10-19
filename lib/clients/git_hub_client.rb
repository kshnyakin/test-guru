class GitHubClient
  ACCESS_TOKEN =  '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'.freeze

  def initialize
    @client = Octokit::Client.new(:bearer_token => ACCESS_TOKEN)
  end

  def create_gist(params)
    @client.create_gist(params.to_json)
  end

end
