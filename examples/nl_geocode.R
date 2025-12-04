data("addresses")
r <- nl_geocode(addresses$Address, output = "data.frame")
r["weergavenaam"]
names(r)

# or if you have sf installed
if (requireNamespace("sf", quietly = TRUE)){
  r_sf <- nl_geocode(addresses$Address, output = "wgs84")
  print(r_sf)
}
