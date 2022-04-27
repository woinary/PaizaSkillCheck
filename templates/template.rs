use std::io;

fn main() {
    let mut line = String::new();
    io::stdin().read_line(&mut line)
        .expect("read_line error.");
    let line = line
        .trim();
    let num = line.parse()
        .unwrap();

    for i in 0..num {
        let mut line = String::new();
        io::stdin().read_line(&mut line)
            .expect("read_line error.");
        let mut s = line
            .trim()
            .split(' ');
        let str1 = s.next()
            .unwrap();
        let str2 = s.next()
            .unwrap();
        println!("{} : hello = {} ,world =  {}", i, str1, str2);
    }
}