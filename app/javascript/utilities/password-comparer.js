class PasswordComparer {
  constructor(passwordField, confirmationPasswordField) {
    this.passwordField = passwordField
    this.confirmationPasswordField = confirmationPasswordField
  }

  clearClass() {
    this.passwordField.removeAttribute("class")
    this.confirmationPasswordField.removeAttribute("class")
  }

  runCompareAndStyle() {
    this.clearClass()
    this.compareValues()
  }

  addCorrectCLass() {
    this.passwordField.classList.add('password_correct')
    this.confirmationPasswordField.classList.add('password_correct')
  }

  addIncorrectCLass() {
    this.passwordField.classList.add('password_incorrect')
    this.confirmationPasswordField.classList.add('password_incorrect')
  }

  compareValues() {
    let passwordConfirmValue = this.confirmationPasswordField.value
    let passwordValue = this.passwordField.value
    if (passwordConfirmValue.length === 0) { return }

    if (passwordValue === passwordConfirmValue) {
      this.addCorrectCLass()
    } else {
      this.addIncorrectCLass()
    }
  }
}

module.exports = PasswordComparer
