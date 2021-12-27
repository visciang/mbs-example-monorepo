pub fn hello() {
    println!("Hello, rust_sublib!");
}

pub fn add_one(x: u32) -> u32 {
    x + 1
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_adds_one() {
        assert_eq!(3, add_one(2));
    }
}
