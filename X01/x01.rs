use std::io;

fn main() {
    let mut line = String::new();
    io::stdin().read_line(&mut line)
        .expect("read_line error.");
    let line = line.trim();
    let num_unit: i32 = line.parse().unwrap();
    let unit_length = num_unit * 25;
    println!("{}", unit_length);
}
