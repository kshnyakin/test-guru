document.addEventListener('turbolinks:load', function() {
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

  var arrowUp = this.querySelector('.octicon-arrow-up')
  var arrowDown = this.querySelector('.octicon-arrow-down')

  if (arrowUp.classList.contains('hide')) {
    arrowUp.classList.remove('hide')
    arrowDown.classList.add('hide')
    sortedRows.sort(compareRowsAsc)
  } else {
    arrowUp.classList.add('hide')
    arrowDown.classList.remove('hide')
    sortedRows.sort(compareRowsDesc)
  }

  var sortedTable = document.createElement('table')
  var tableBody = document.createElement('tbody')
  sortedTable.classList.add('table')
  sortedTable.classList.add('table-hover')
  sortedTable.classList.add('table-tests')
  tableBody.appendChild(rows[0])
  
  for (var i = 0; i < sortedRows.length; i++) {
    tableBody.appendChild(sortedRows[i])
  }

  sortedTable.appendChild(tableBody)
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
