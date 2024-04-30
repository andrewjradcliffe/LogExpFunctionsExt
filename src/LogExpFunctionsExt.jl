module LogExpFunctionsExt

using LogExpFunctions

export loglogistic, logitexp, log1mlogistic, logit1mexp

#=
this uses the identity:

log(logistic(x)) = -log(1 + exp(-x))
=#
"""
    loglogistic(x)

The natural logarithm of the `logistic` function, computed more
carefully and with fewer calls than than the composition
`log(logistic(x))`.

Its inverse is the [`logitexp`](@ref) function.
"""
loglogistic(x::AbstractFloat) = -log1pexp(-x) #
loglogistic(x::T) where {T<:Real} = -log1pexp(-convert(Base.promote_type(Float64, T), x))

#=
this uses the identity:

logit(exp(x)) = log(exp(x) / (1 + exp(x))) = log(exp(x)) - log(1 - exp(x))
=#
"""
    logitexp(x)

The logit of the exponential of `x`, computed more carefully and
with fewer function calls than `logit(exp(x))`

Its inverse is the [`loglogistic`](@ref) function.
"""
logitexp(x::Real) = x - log1mexp(x)

#=
this uses the identity:

log(logistic(-x)) = -log(1 + exp(x))

that is, negation in the log-odds domain.
=#

"""
    log1mlogistic(x)

The natural logarithm of the 1 minus the inverse logit function,
computed more carefully and with fewer function calls than `log(1 -
logistic(x))`.

Its inverse is the [`logit1mexp`](@ref) function.
"""
log1mlogistic(x::Real) = -log1pexp(x)

#=

this uses the same identity as `logitexp`, followed by negation on the
log-odds scale, i.e. -logit(exp(x)) = log(1 - exp(x)) - log(exp(x))

=#

"""
    logit1mexp(x)

The logit of 1 minus the exponential of `x`, computed more carefully
and with fewer function calls than `logit(1 - exp(x))`.


Its inverse is the [`log1mlogistic`](@ref) function.
"""
logit1mexp(x::Real) = log1mexp(x) - x


end # module LogExpFunctionsExt
