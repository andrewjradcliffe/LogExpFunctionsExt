using LogExpFunctionsExt, Test, Random
using LogExpFunctions: logistic, logit

@testset "loglogistic: $T" for T in (Float16, Float32, Float64)
    lim1 = T === Float16 ? -14.0 : -50.0
    lim2 = T === Float16 ? -10.0 : -37.0
    xs = T[Inf, -Inf, 0.0, lim1, lim2]
    for x in xs
        @test loglogistic(x) == log(logistic(x))
    end

    ϵ = eps(T)
    xs = T[ϵ, 1.0, 18.0, 33.3, 50.0]
    for x in xs
        lhs = loglogistic(x)
        rhs = log(logistic(x))
        @test abs(lhs - rhs) < ϵ
    end

    # misc
    @test loglogistic(T(Inf)) == -zero(T)
    @test loglogistic(-T(Inf)) == -T(Inf)
    @test loglogistic(-T(103.0)) == -T(103.0)
    @test abs(loglogistic(T(35.0))) < 3eps(T)
    @test abs(loglogistic(T(103.0))) < eps(T)
    @test isfinite(loglogistic(-T(745.0)))
    @test isfinite(loglogistic(T(50.0)))
    @test isfinite(loglogistic(T(745.0)))
end


@testset "logitexp: $T" for T in (Float16, Float32, Float64)
    ϵ = eps(T)
    xs = T[ϵ, √ϵ, 0.2, 0.4, 0.8, 1.0 - √ϵ, 1.0 - ϵ]
    neg_xs = -xs
    for x in xs
        @test abs(logitexp(loglogistic(x)) - x) < ϵ
    end
    for x in neg_xs
        @test abs(logitexp(loglogistic(x)) - x) < 2ϵ
    end
    xs = T[-Inf, 0.0, Inf]
    for x in xs
        @test logitexp(loglogistic(x)) == x
    end
end

@testset "log1mlogistic: $T" for T in (Float16, Float32, Float64)
    @test log1mlogistic(T(Inf)) == -T(Inf)
    @test log1mlogistic(-T(Inf)) == -zero(T)
    @test log1mlogistic(-T(103.0)) < eps(T)
    @test abs(log1mlogistic(T(35.0))) == T(35.0)
    @test abs(log1mlogistic(T(103.0))) == T(103.0)
    @test isfinite(log1mlogistic(-T(745.0)))
    @test isfinite(log1mlogistic(T(50.0)))
    @test isfinite(log1mlogistic(T(745.0)))
end


@testset "logit1mexp: $T" for T in (Float16, Float32, Float64)
    ϵ = eps(T)
    xs = T[ϵ, √ϵ, 0.2, 0.4, 0.8, 1.0 - √ϵ, 1.0 - ϵ]
    neg_xs = -xs
    for x in xs
        @test abs(logit1mexp(log1mlogistic(x)) - x) < 2ϵ
    end
    for x in neg_xs
        @test abs(logit1mexp(log1mlogistic(x)) - x) < ϵ
    end
    xs = T[-Inf, 0.0, Inf]
    for x in xs
        @test logit1mexp(log1mlogistic(x)) == x
    end
end
