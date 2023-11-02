document.addEventListener('turbolinks:load', function() {
  let passwordField = document.querySelector('#user_password')
  let passwordConfirmationField = document.querySelector('#user_password_confirmation')
  passwordField.addEventListener('input', comparePasswords)
  passwordConfirmationField.addEventListener('input', comparePasswords)
})

function comparePasswords() {
  let passwordField = document.querySelector('#user_password')
  let confirmationPasswordField = document.querySelector('#user_password_confirmation')
  let passwordValue = passwordField.value
  let passwordConfirmValue = confirmationPasswordField.value

  passwordField.removeAttribute("class")
  confirmationPasswordField.removeAttribute("class")
  if (passwordConfirmValue.length === 0) { return }
  switch (passwordValue === passwordConfirmValue) {
    case true:
      passwordField.classList.add('password_correct')
      confirmationPasswordField.classList.add('password_correct')
      break
    case false:
      passwordField.classList.add('password_incorrect')
      confirmationPasswordField.classList.add('password_incorrect')
      break
  }
}
