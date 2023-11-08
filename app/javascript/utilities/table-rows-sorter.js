class TableRowsSorter {
  constructor(table) {
    this.table = table
  }

  sort() {
    let rows = this.table.querySelectorAll('tr')
    let unSortedRows = []

    for (var i = 1; i < rows.length; i++) {
      unSortedRows.push(rows[i])
    }

    let arrowUp = this.table.querySelector('.octicon-arrow-up')
    let arrowDown = this.table.querySelector('.octicon-arrow-down')
    let sortedRows = this.ascDescSort(arrowUp, arrowDown, unSortedRows)
    this.tableManipulations(rows, sortedRows)
  }

  ascDescSort(arrowUp, arrowDown, unSortedRows) {
    if (arrowUp.classList.contains('hide')) {
      arrowUp.classList.remove('hide')
      arrowDown.classList.add('hide')
      unSortedRows.sort(this.compareRowsAsc)
    } else {
      arrowUp.classList.add('hide')
      arrowDown.classList.remove('hide')
      unSortedRows.sort(this.compareRowsDesc)
    }
    return unSortedRows
  }

  tableManipulations(rows, sortedRows) {
    let sortedTable = document.createElement('table')
    let tableBody = document.createElement('tbody')
    sortedTable.classList.add('table')
    sortedTable.classList.add('table-hover')
    sortedTable.classList.add('table-tests')
    tableBody.appendChild(rows[0])

    for (var i = 0; i < sortedRows.length; i++) {
      tableBody.appendChild(sortedRows[i])
    }

    sortedTable.appendChild(tableBody)
    this.table.parentNode.replaceChild(sortedTable, this.table)
  }

  compareRowsAsc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0
  }

  compareRowsDesc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
    return 0
  }

}

module.exports = TableRowsSorter
