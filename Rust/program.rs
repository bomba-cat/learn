use simple_user_input::get_input; //Simple User Input by Xpyder, https://users.rust-lang.org/t/how-to-get-user-input/5176/7

fn main() {
    // Get user input and convert to int i32
    let rangeString: String = get_input("range: ");
    let markString: String = get_input("mark every: ");

    let range: i32 = rangeString.parse().unwrap();
    let mark: i32 = markString.parse().unwrap();

    // Loop
    for num in 1..range+1 {
        // Check if num is marked
        if num % mark == 0 {
            println!("{} <--", num);
        } else {
            println!("{}", num);
        }
    }
}

mod simple_user_input {
    use std::io;
    use std::io::Write;
    pub fn get_input(prompt: &str) -> String{
        print!("{}",prompt);
        io::stdout().flush().unwrap();
        let mut input = String::new();
        match io::stdin().read_line(&mut input) {
            Ok(_goes_into_input_above) => {},
            Err(_no_updates_is_fine) => {},
        }
        input.trim().to_string()
    }
}
