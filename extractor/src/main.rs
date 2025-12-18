mod autobuild;
mod generator;
mod extractor;

use clap::Parser;

#[derive(Parser)]
#[command(author, version, about)]
enum Cli {
    Extract(extractor::Options),
    Generate(generator::Options),
    Autobuild(autobuild::Options),
}

fn main() -> std::io::Result<()> {
    let cli = Cli::parse();

    match cli {
        Cli::Extract(options) => extractor::run(options),
        Cli::Generate(options) => generator::run(options),
        Cli::Autobuild(options) => autobuild::run(options),
    }
}