use structopt::StructOpt;
use toml_edit::{Document, Item};

use crate::config::Opt;

mod config;

fn delete_key(doc: &mut Document, key: &str) {
    let keypath: Vec<&str> = key.split(".").into_iter().collect();
    if keypath.len() > 1 {
        if let Some((tail, head)) = keypath.split_last() {
            if let Some(Item::Table(ref mut table)) = doc.get_mut(head.join(".").as_str()) {
                table.remove(tail);
            }
        }
    } else {
        doc.remove(key);
    }
}

fn main() {
    let conf = Opt::from_args();
    let something = std::fs::read_to_string(conf.file).unwrap();
    let mut doc = something.parse::<Document>().unwrap();
    for key in conf.delete {
        delete_key(&mut doc, key.as_str());
    }
    println!("{}", doc.to_string());
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_delete_key() {
        let input = r#"
            [package]
            name = "something"
            version = "something"
        "#;

        let output = r#"
            [package]
            name = "something"
        "#;
        let mut input = input.parse::<Document>().unwrap();
        delete_key(&mut input, "package.version");
        assert_eq!(input.to_string(), output.to_string());
    }
}
