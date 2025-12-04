if (requireNamespace("sf", quietly = TRUE)){
  l <- nl_free("Henri Faasdreef 312")
  l$response$numFound
  l$response$docs["weergavenaam"]
}
