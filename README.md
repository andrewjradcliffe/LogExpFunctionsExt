[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://andrewjradcliffe.github.io/LogExpFunctionsExt.jl/stable)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://andrewjradcliffe.github.io/LogExpFunctionsExt.jl/dev)
# LogExpFunctionsExt.jl

Provides a few extensions to
[LogExpFunctions](https://github.com/JuliaStats/LogExpFunctions.jl),
namely, the functions: `loglogistic`, `logitexp`, `log1mlogistic`, and
`logit1mexp`. This takes advantage of `LogExpFunctions`'s accurate
implementations of `log1pexp` and `log1mexp`, combined with negation
in the log-odds domain to provide more accurate and less expensive
implementations of the function compositions. See the documentation
for more details.
