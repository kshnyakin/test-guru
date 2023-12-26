document.addEventListener('turbolinks:load', function() {
  let timerContainer = document.querySelector('.timer-container')
  if (timerContainer) {
    console.log("Hello, we are from = timerContainer")
    let nextButton = document.querySelector('.timer-container')
    let timerOutput = document.querySelector('.timer-value')

    let passingStartedAt = Date.parse(timerContainer.dataset['testPassingStartedAt'])
    let testDurationSec = parseInt(timerContainer.dataset['testDurationSec'])
    // let current_time_sec = Date.now()
    let passingExpiredAt = passingStartedAt + testDurationSec
    // console.log(passingStartedAt, current_time_sec, testDurationSec)
    // let delta_seconds = current_time_sec - passingStartedAt
    // console.log('Delta seconds = ', delta_seconds)

    // заполнение элемента числом
    // timerOutput.innerHTML = "200"
    
    // нажимаем кнопку "Следующий вопрос"
    // nextButton.click()

    // while (delta_seconds < testDurationSec) {
      // delta_seconds = current_time_sec - passingStartedAt
      // timerOutput.innerHTML = delta_seconds
    // }

    // nextButton.click()
    launchTimer(passingExpiredAt)


    
    // let passingProgress = new TestPassingProgress
    // passingProgress.fillColorBarElements()
    // button = document.querySelector('.btn')
    // button.addEventListener('click', (event) => nextButtonHandler(event, passingProgress))

    function launchTimer(secondsExpiredAt) {
      console.log('launchTimer')
      timer = setInterval(function() {
        timeBetweenDates(secondsExpiredAt);
      }, 1000);
    }
    
    function timeBetweenDates(toDate) {
      console.log('timeBetweenDates')
      let dateEntered = toDate
      let now = new Date()
      let difference = dateEntered - now.getTime()
      if (difference <= 0) {
    
        // Timer done
        clearInterval(timer);
      
      } else {
        
        var seconds = Math.floor(difference / 1000);
        var minutes = Math.floor(seconds / 60);
        var hours = Math.floor(minutes / 60);
        var days = Math.floor(hours / 24);
    
        hours %= 24;
        minutes %= 60;
        seconds %= 60;
    
        let daysElement = document.getElementById("days")
        let hoursElement = document.getElementById("hours")
        let minutesElement = document.getElementById("minutes")
        let secondsElement = document.getElementById("seconds")
    
        daysElement.innerHTML = days
        hoursElement.innerHTML = hours
        minutesElement.innerHTML = minutes
        secondsElement.innerHTML = seconds
    
      }
    }

  }
})

// function nextButtonHandler(event, passingProgress) {
//   let questionId = event.currentTarget.dataset.questionId
//   passingProgress.handleNextQuestionPressedButton(questionId)
// }

