const TableRowsSorter = require('./table-rows-sorter.js')

document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.sort-by-title')
  if (control) {control.addEventListener('click', sortRowsByTitle)}
})

function sortRowsByTitle() {
  let table = document.querySelector('table.table-tests')
  
  tableSorter = new TableRowsSorter(table)
  tableSorter.sort()
}
