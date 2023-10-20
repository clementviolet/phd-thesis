library(tidyverse)
library(terra)

data <- rast(
    "Src/02-Introduction/OceanSODA_ETHZ-v2023.OCADS.01_1982-2022.nc"
) %>% set.ext(c(-179.5, 179.5, -89.5, 89.5))

data <- data[[str_detect(names(data), "ph_total_[:digit:]+")]]

n_layers <- nlyr(data)
n_years <- n_layers / 12

# Initialize an empty list to store yearly average rasters
yearly_means <- numeric(n_years)

for (i in 1:n_years) {
    print(i)
    # Calculate the start and end layers for each year
    start_layer <- (i-1)*12 + 1
    end_layer <- i*12
    
    # Extract layers for the year
    yearly_data <- data[[start_layer:end_layer]]
    
    # Compute the mean value for the year and store it
    yearly_means[i] <- mean(values(mean(yearly_data), mat = FALSE, na.rm = TRUE))
}

pH_df <- data.frame(
    year = 1982:2022,
    ph_avg = yearly_means
)

ggplot() +
    geom_rect(
        data = pH_df,
        aes(
            fill = ph_avg,
            colour = ph_avg,
            xmin = year - 0.5, xmax = year + 0.5,
            ymax = ph_avg),
        ymin = 8.035) +
    cmocean::scale_fill_cmocean(
        name = "curl",
        direction = -1,
    ) +
    cmocean::scale_colour_cmocean(
        name = "curl",
        direction = -1,
    ) +
    geom_rangeframe(
        data = data.frame(
            x = seq(1981.5, 2023),
            y = seq(8.035, 8.13, length.out = length(seq(1981.5, 2023)))
        ),
        aes(x = x, y = y)
    ) +
    scale_x_continuous(breaks = seq(1985, 2020, 5)) +
    scale_y_continuous(breaks = seq(8.04, 8.13, 0.01)) +
        labs(
        x = "Année",
        y = "pH Océanique Moyen"
    ) +
    coord_cartesian(
        x = c(1980.25, 2023),
        y = c(8.03, 8.13),
        clip = "off", expand = FALSE
        ) +
    ggthemes::theme_tufte(base_family = "sans") +
    theme(legend.position = "none")

#########################################

temp_df <- read.csv("Src/02-Introduction/HadSST.4.0.1.0_annual_GLOBE.csv")

ggplot(temp_df %>% filter(year < 2023), aes(x = year, y = anomaly)) +
    geom_col(aes(fill = anomaly, color = anomaly), width = 1) +
    scico::scale_fill_scico(palette = "vik", midpoint = 0) +
    scico::scale_colour_scico(palette = "vik", midpoint = 0) +
    scale_y_continuous(breaks = seq(-0.6, 0.6, 0.3)) +
    scale_x_continuous(breaks = seq(1860, 2020, 20)) +
    geom_rangeframe() +
    labs(
        x = "Année",
        y = "Anomalie de la Températude de Surface des Océans"
    ) +
    coord_cartesian(
        x = c(1848, 2025),
        y = c(-0.65, 0.77),
        clip = "off", expand = FALSE
    ) +
    ggthemes::theme_tufte(base_family = "sans") +
    theme(legend.position = "none")
