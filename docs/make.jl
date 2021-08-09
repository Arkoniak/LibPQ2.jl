using Documenter, LibPQ2, Memento

setlevel!(getlogger(LibPQ2), "critical")

DocMeta.setdocmeta!(LibPQ2, :DocTestSetup, quote
    using LibPQ2
    DATABASE_USER = get(ENV, "LIBPQJL_DATABASE_USER", "postgres")
    conn = LibPQ.Connection("dbname=postgres user=$DATABASE_USER")
end; recursive=true)

makedocs(;
    modules=[LibPQ2],
    format=Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages=[
        "Home" => "index.md",
        "Type Conversions" => "pages/type-conversions.md",
        "API" => "pages/api.md",
        "FAQ" => "pages/faq.md",
    ],
    repo="https://github.com/arkoniak/LibPQ2.jl/blob/{commit}{path}#L{line}",
    sitename="LibPQ2.jl",
    checkdocs=:exports,
    linkcheck=true,
    linkcheck_timeout=60,
    strict=true,
    authors="Eric Davies",
)

deploydocs(;
    repo="github.com/arkoniak/LibPQ2.jl",
)
