\dontrun{

sug <- nl_suggest("Henri Faasdreef")

# how many objects have a score?
sug$response$numFound

# get suggestions
sug$response$docs

}
