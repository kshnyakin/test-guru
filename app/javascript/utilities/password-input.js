class PasswordInput {
  constructor(el) {
    this.element = el;
  }

  clearClass() {
    this.element.removeAttribute("class")
  }

  addCorrectCLass() {
    this.element.classList.add('password_correct')
  }

  addIncorrectCLass() {
    this.element.classList.add('password_incorrect')
  }
}

module.exports = PasswordInput // 👈 Export class
