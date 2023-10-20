library(tidyverse)
library(sf)

france <- st_as_sf(maps::map("france", plot = FALSE, fill = TRUE))

ggplot(france) +
  geom_sf(
    data = france %>% filter(ID %in% c(
      "Ille-et-Vilaine",
      "Finistere",
      "Cotes-Darmor",
      "Morbihan"
    )),
    color = "black",
    fill = "black",
  ) +
  theme_void()

ggsave("Src/02-Introduction/figures/brittany.svg", device = "svg")

data <- rnaturalearth::ne_countries(scale = 10) %>%
    st_as_sf()

ggplot(data %>% filter(admin == "Australia")) +
    geom_sf(fill = "black") +
    coord_sf(ylim = c(-44, -10)) +
    theme_void()

ggsave("Src/02-Introduction/figures/australia.svg", device = "svg")

crs <- "+proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +datum=WGS84 +units=m +no_defs"

ctrys10m <- rnaturalearth::ne_countries(scale = 10, type = "countries", returnclass = "sf") %>%
  select(iso_a3, iso_n3, admin)

sphere <- sf::st_graticule(ndiscr = 10000, margin = 10e-6) %>%
  st_transform(crs = crs) %>%
  st_convex_hull() %>%
  summarise(geometry = st_union(geometry))

ggplot() +
  geom_sf(data = sphere, fill = "transparent") +
  geom_sf(data = ctrys10m, fill = "black", color = "black") +
  theme_void() +
  theme(panel.grid = element_blank())


ggsave("Src/02-Introduction/figures/world.svg", device = "svg")