const PasswordComparer = require('./password-comparer.js')

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
    comparer = new PasswordComparer(passwordField, confirmationPasswordField)
    comparer.runCompareAndStyle()
  }
}
