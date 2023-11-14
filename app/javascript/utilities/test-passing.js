document.addEventListener('turbolinks:load', function() {
  let progressBar = document.querySelector('.progress-container')
  if (progressBar) {
    let passedQuestionIds = getCurrentQuestionIds()
    let barElements = document.querySelectorAll('.progress-bar')
    for (let i = 0; i < barElements.length; i++) {
      if (passedQuestionIds.includes(barElements[i].dataset.questionId)) {
        makeBarPassed(barElements[i])
      } else {
        makeBarNotPassed(barElements[i])
      }
    }
    button = document.querySelector('.btn')
    button.addEventListener('click', nextButtonHandler)
  }
})

function nextButtonHandler() {
  let questionId = this.dataset.questionId
  let passedQuestionIds = localStorage.getItem("passed_questions_id")
  if (passedQuestionIds) {
    addQuestionIdToStorage(questionId)
  } else {
    initPassedQuestionIdsStoring(questionId)
  }

  if (questionLast(questionId)) {
    localStorage.removeItem("passed_questions_id")
  }
}

function questionLast(questionId) {
  let barsArr = document.querySelectorAll('.progress-bar')
  let lastBarQuestionId = barsArr[barsArr.length-1].dataset.questionId 
  return lastBarQuestionId === questionId
}

function getCurrentQuestionIds() {
  let localStorageValue = localStorage.getItem("passed_questions_id")
  if (localStorageValue) {
    return localStorageValue.split(',')
  } else {
    return []
  }
}

function initPassedQuestionIdsStoring(questionId) {
  localStorage.setItem("passed_questions_id", questionId)
}

function addQuestionIdToStorage(questionId) {
  let questionIds = localStorage.getItem("passed_questions_id")
  let questionIdsArr = questionIds.split(',')
  questionIdsArr.push(questionId)
  localStorage.setItem("passed_questions_id", questionIdsArr)
}

function makeBarPassed(barElement) {
  barElement.classList.remove('not-passed')
  barElement.classList.add('passed')
}

function makeBarNotPassed(barElement) {
  barElement.classList.remove('passed')
  barElement.classList.add('not-passed') 
}
