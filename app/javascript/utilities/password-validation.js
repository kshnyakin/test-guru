const PasswordInput = require('./password-input.js')

document.addEventListener('turbolinks:load', function() {
  const form = document.querySelector('.form-group')
  const passwordField = document.getElementById('user_password')
  const passwordConfirmationField = document.getElementById('user_password_confirmation')
  if (form && passwordField && passwordConfirmationField) {
    form.addEventListener('input', (event) => comparePasswords(event, passwordField, passwordConfirmationField))
  }
})

function comparePasswords(event, passwordField, confirmationPasswordField) {
  let passwordValue = passwordField.value
  let passwordConfirmValue = confirmationPasswordField.value

  const activeIds = ['user_password_confirmation', 'user_password']

  if (activeIds.includes(event.srcElement.id)) {
    let passwordElement = new PasswordInput(passwordField)
    let passwordConfirmElement = new PasswordInput(confirmationPasswordField)
    passwordElement.clearClass()
    passwordConfirmElement.clearClass()
    if (passwordConfirmValue.length === 0) { return }
    if (passwordValue === passwordConfirmValue) {
      passwordElement.addCorrectCLass()
      passwordConfirmElement.addCorrectCLass()
    } else {
      passwordElement.addIncorrectCLass()
      passwordConfirmElement.addIncorrectCLass()
    }
  }
}
