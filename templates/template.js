const lines = require("fs").readFileSync("/dev/stdin", "utf8").split("\n");
let count = lines[0];
for (let i = 0; i < count; i++) {
  const line = lines[i+1].split(" ");
  console.log("hello = " + line[0] + ", world = " + line[1]);
}
