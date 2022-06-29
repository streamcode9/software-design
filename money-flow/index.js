const fs = require('fs');

fs.readdir(__dirname, function (err, files) {
    //handling error
    if (err) {
        return console.log('Unable to scan directory: ' + err);
    } 
    //listing all files using forEach
    files.forEach(function (file) {
        // Do whatever you want to do with the file
        console.log(file); 
    });
});

fs.readFile('./data.csv', 'utf8', (err, data) => {
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
