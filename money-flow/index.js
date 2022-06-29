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

for (const [key, value] of Object.entries(dict)) {
  console.log(`${key}: ${value}`);
}

