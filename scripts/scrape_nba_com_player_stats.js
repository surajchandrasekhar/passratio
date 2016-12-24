data = []
rows = $("tr").slice(1,445)
rows.each((i,r) => {
    var columns = $(r).find('td')
	var row = []
	columns.each((i,c) => {
		var num = Number($(c).text())
		if (isNaN(num))
			row.push($(c).text())
		else
			row.push(num)
	})
    data.push(row)
})

strings = data.map(row => {
	row.join(',')
})

strings.join('\n')
