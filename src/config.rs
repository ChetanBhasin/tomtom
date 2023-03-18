use std::path::PathBuf;

use structopt::StructOpt;

#[derive(Debug, StructOpt)]
#[structopt(name = "tomtom")]
pub struct Opt {
    pub file: PathBuf,
    #[structopt(short, long)]
    /// A key that needs to be deleted. Multiple keys van be specified.
    pub delete: Vec<String>,
    #[structopt(short, long)]
    /// A key that needs to be renamed. Multiple keys van be specified.
    pub rename: Vec<String>,
    #[structopt(short, long)]
    /// Tells tomtom to modify the file in place instead of sending the output to stdout.
    pub in_place: bool,
}
