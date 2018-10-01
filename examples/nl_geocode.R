\dontrun{

data("addresses")

r <- nl_geocode(addresses$Address)
r["weergavenaam"]
names(r)

}
