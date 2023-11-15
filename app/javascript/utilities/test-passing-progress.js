class TestPassingProgress {

  fillColorBarElements() {
    let barElements = document.querySelectorAll('.progress-bar')
    let passedQuestionIds = this.getPassedQuestionIdsArr()
    for (let i = 0; i < barElements.length; i++) {
      if (passedQuestionIds.includes(barElements[i].dataset.questionId)) {
        this.makeBarPassed(barElements[i])
      } else {
        this.makeBarNotPassed(barElements[i])
      }
    }
  }

  getPassedQuestionIdsArr() {
    let localStorageValue = localStorage.getItem("passed_questions_id")
    if (localStorageValue) {
      return localStorageValue.split(',')
    } else {
      return []
    }
  }

  makeBarPassed(barElement) {
    barElement.classList.remove('not-passed')
    barElement.classList.add('passed')
  }

  makeBarNotPassed(barElement) {
    barElement.classList.remove('passed')
    barElement.classList.add('not-passed') 
  }

  handleNextQuestionPressedButton(questionId) {
    if (this.questionIsLast(questionId)) {
      localStorage.removeItem("passed_questions_id")
      return
    }

    if (localStorage.getItem("passed_questions_id")) {
      this.addQuestionIdToStorage(questionId)
    } else {
      this.initPassedQuestionIdsStoring(questionId)
    }
  }

  addQuestionIdToStorage(questionId) {
    let questionIdsArr = this.getPassedQuestionIdsArr()
    questionIdsArr.push(questionId)
    localStorage.setItem("passed_questions_id", questionIdsArr)
  }

  initPassedQuestionIdsStoring(questionId) {
    localStorage.setItem("passed_questions_id", questionId)
  }

  questionIsLast(questionId) {
    let barsArr = document.querySelectorAll('.progress-bar')
    let lastBarQuestionId = barsArr[barsArr.length-1].dataset.questionId 
    return lastBarQuestionId === questionId
  }
}

module.exports = TestPassingProgress
