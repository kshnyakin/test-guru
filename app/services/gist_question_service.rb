# frozen_string_literal: true

class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    result = @client.create_gist(gist_params)
    OpenStruct.new(
      'response' => handle_response(result),
      'success?' => result.html_url.present?
    )
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def handle_response(response)
    {
      html_url: response.html_url,
      gist_id: response.id
    }
  end
end
