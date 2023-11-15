const TestPassingProgress = require('./test-passing-progress.js')

document.addEventListener('turbolinks:load', function() {
  let progressBar = document.querySelector('.progress-container')
  if (progressBar) {
    let passingProgress = new TestPassingProgress
    passingProgress.fillColorBarElements()
    button = document.querySelector('.btn')
    button.addEventListener('click', (event) => nextButtonHandler(event, passingProgress))
  }
})

function nextButtonHandler(event, passingProgress) {
  let questionId = event.currentTarget.dataset.questionId
  passingProgress.handleNextQuestionPressedButton(questionId)
}
