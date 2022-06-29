const fs = require('fs');

const files = fs.readdirSync(__dirname)

console.log(files)
console.log(files[0])

fs.readFile(files[0], 'utf8', (err, data) => {
  if (err) {
    console.error(err);
    return
  }

  const rows = data.split('\r\n')
    .filter(row => {
        const cols = row.split(',')
        return cols[0].length > 0
    })
    .filter(row => {
        const cols = row.split(',')
        const date = Date.parse(cols[0].slice(1, cols[0].length - 1) + ":00:00:00Z")
        return !isNaN(date)
    });

  const dict = rows.reduce((acc, row) => {
    const cols = row.split(',')
    const date = new Date(Date.parse(cols[0].slice(1, cols[0].length - 1) + ":00:00:00Z"))
    const typi = cols[4]
    const desc = cols[5]
    const outc  = cols[6]
    const inco   = cols[7]

    const key = date.getFullYear().toString() + '-' + date.getMonth().toString();
    (acc[key] = acc[key] || []).push({ date, typi, desc, outc, inco })
    return acc
  }, {})

  for (const [key, xs] of Object.entries(dict)) {
    const ok =
      xs.reduce((a,x)=>a+x.inco,0)
      -xs.reduce((a,x)=>a+x.outc,0)
    console.log(`${key}: ${ok}`);
  }
});
