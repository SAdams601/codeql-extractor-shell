use std::env;
use std::path::PathBuf;

use clap::Args;

use codeql_extractor::autobuilder;

#[derive(Args)]
// The autobuilder takes no command-line options, but this may change in the future.
pub struct Options {}

pub fn run(_: Options) -> std::io::Result<()> {
    let database = env::var("CODEQL_EXTRACTOR_SHELL_WIP_DATABASE")
        .expect("CODEQL_EXTRACTOR_SHELL_DATABASE not set");

    autobuilder::Autobuilder::new("shell", PathBuf::from(database))
        .include_extensions(&[".sh"])
        .exclude_globs(&["**/.git"])
        .size_limit("10m")
        .run()
}