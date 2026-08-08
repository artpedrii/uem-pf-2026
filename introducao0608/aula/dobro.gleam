import gleam/io 

pub fn dobro(x: Int) -> Int {
x * 2
}
pub fn main() {
io.debug(dobro(8))
}