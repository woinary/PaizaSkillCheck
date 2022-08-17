const lines = require("fs").readFileSync("/dev/stdin", "utf8").split("\n");
const num_unit = Number(lines[0]);
const unit_length = num_unit * 25
console.log(unit_length)