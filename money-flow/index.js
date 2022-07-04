const fs = require('fs');

const files = fs.readdirSync(__dirname)

//console.log(files)
//console.log(files[0])

//fs.readFile(files[0], 'utf8', (err, data) => {
  //if (err) {
  //  console.error(err);
  //  return
  //}
  const data =
    '"2022-06-27","2022-06-28","0","a0","Visa","*1111 25.06 Try 110.00 Rs Ares Kurs: 0.6097",6707,\r\n'
    +'"2022-06-27","2022-06-28","0","a0","Visa","*1111 25.06 Try 110.00 Rs Ares Kurs: 0.6097",6707,\r\n'
    +'"2022-06-20","2022-06-20","0","a0","?","Fra: some",,7000'

  const rows = data.split('\r\n')
    .map((row, i) => [i, row])
    .filter(([i, row]) => {
        const cols = row.split(',')
        return cols[0].length > 0
    })
    .filter(([i, row]) => {
        const cols = row.split(',')
        const date = Date.parse(cols[0].slice(1, cols[0].length - 1) + ":00:00:00Z")
        return !isNaN(date)
    });

  const dict = rows.reduce((acc, [i, row]) => {
    const cols = row.split(',')
    const date = new Date(Date.parse(cols[0].slice(1, cols[0].length - 1) + ":00:00:00Z"))
    const typi = cols[4]
    const desc = cols[5]
    const outc = cols[6].length === 0 ? 0 : parseFloat(cols[6])
    const inco = cols[7].length === 0 ? 0 : parseFloat(cols[7])

    const key = date.getFullYear().toString() + '-' + date.getMonth().toString();
    (acc[key] = acc[key] || []).push({ i, row, date, typi, desc, outc, inco })
    return acc
  }, {})

  const resTable = []
  for (const [key, xs] of Object.entries(dict)) {
    /*if (key === '2022-2') console.log(xs.map(x => [x.i, x.row, x.outc]))*/
    const inco = xs.reduce((a,x)=>a+x.inco,0)
    const outc = xs.reduce((a,x)=>a+x.outc,0)
    resTable.push([key, inco/100, -outc/100, (inco-outc)/100]);
  }
  console.table(resTable);
  const totInco = Object.entries(dict).reduce((acc, [_, xs]) => acc + xs.reduce((a,x)=>a+x.inco,0), 0)
  const totOutc = Object.entries(dict).reduce((acc, [_, xs]) => acc + xs.reduce((a,x)=>a+x.outc,0), 0)
  console.table([totInco/100, -totOutc/100, (totInco-totOutc)/100])
//});
