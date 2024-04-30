using Documenter, LogExpFunctionsExt

makedocs(sitename = "LogExpFunctionsExt.jl", pages = ["Home" => "index.md"])

deploydocs(
    repo = "github.com/andrewjradcliffe/LogExpFunctionsExt.jl.git",
    branch = "gh-pages",
    devbranch = "main",
    versions = ["stable" => "v^", "v#.#", "dev" => "main"],
    devurl = "dev",
)
