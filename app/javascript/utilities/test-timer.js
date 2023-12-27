document.addEventListener('turbolinks:load', function() {
  let timerContainer = document.querySelector('.timer-container')
  if (timerContainer) {
    let testPassingForm  = document.querySelector('.test-passing-form')
    let passingStartedAt = Date.parse(timerContainer.dataset['testPassingStartedAt'])
    let testDurationSec = parseInt(timerContainer.dataset['testDurationMilliSeconds'])
    let passingExpiredAt = passingStartedAt + testDurationSec

    launchTimer(passingExpiredAt)

    function launchTimer(secondsExpiredAt) {
      timer = setInterval(function() {
        timeBetweenDates(secondsExpiredAt);
      }, 1000);
    }
    
    function timeBetweenDates(toDate) {
      console.log('timeBetweenDates')
      let dateEntered = toDate
      let now = Date.now()
      let difference = dateEntered - now
      if (difference <= 0) {
    
        clearInterval(timer);
        testPassingForm.submit()
      
      } else {
        
        let seconds = Math.floor(difference / 1000);
        let minutes = Math.floor(seconds / 60);
        let hours = Math.floor(minutes / 60);
        let days = Math.floor(hours / 24);
    
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
