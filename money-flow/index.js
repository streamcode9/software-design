const dict = {
 '2022-0':[
  {inco:9,outc:0},
  {inco:0,outc:8}
 ],
 '2022-1':[
  {inco:5,outc:0},
  {inco:0,outc:8}
 ]
}

for (const [key, xs] of Object.entries(dict)) {
  const ok =
    xs.reduce((a,x)=>a+x.inco,0)
    -xs.reduce((a,x)=>a+x.outc,0)
  console.log(`${key}: ${ok}`);
}

