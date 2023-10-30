console.log("Hello, I'm sorting JS!");

document.addEventListener('turbolinks:load', function() {
  console.log("Hello! Turbolinks are loaded!")
  var control = document.querySelector('.sort-by-title')

  if (control) {control.addEventListener('click', sortRowsByTitle)}
})

function sortRowsByTitle() {
  var table = document.querySelector('table.table-tests')

  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }
  
  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    console.log('inside ASC sorting block', this.querySelector('.octicon-arrow-up').classList)
    sortedRows.sort(compareRowsAsc)
    // sortTable(sortedRows, rows, table)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    console.log('inside DESC sorting block')
    sortedRows.sort(compareRowsDesc)
    // sortTable(sortedRows, rows, table)
    this.querySelector('.octicon-arrow-up').classList.add('hide')
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
  }

  var sortedTable = document.createElement('table')
  sortedTable.classList.add('table')
  sortedTable.classList.add('table-hover')
  sortedTable.classList.add('table-tests')
  console.log('added header', rows[0])
  sortedTable.appendChild(rows[0])
  
  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i]) 
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
   return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
   return 0
}
