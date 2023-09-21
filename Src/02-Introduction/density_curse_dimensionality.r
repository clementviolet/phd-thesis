# Load required libraries
library(tidyverse)

# Normalize the random points to lie on the surface of the n-sphere
normalize_points <- function(points) {
    norms <- sqrt(rowSums(points^2))
    return(points / norms)
}

N <- 1000

dim <- c(2, 4, 8, 16, 32, 64, 128, 256)

set.seed(42)  # For reproducibility

spheres <- map(dim, function(x) {
    # Generate random points in (n+1)-dimensional Euclidean space within B^(n+1)
random_points <- matrix(rnorm(N * (x + 1)), nrow = N, ncol = x + 1)

sphere_points <- normalize_points(random_points)

})

dist <- spheres %>%
    map(~dist(.x))

max_dist <- dist %>%
    map(~max(.x))

ratio_dist <- map2(dist, max_dist, function(dist, max_dist) {
    out <- dist / max_dist

    return(out)
})


color <- c(
    "red", "gold", "lawngreen", "springgreen",
    "lightskyblue", "cornflowerblue", "purple", "deeppink"
)

png(
    "Src/02-Introduction/figures/histogram_curse_dimensionality.png",
    width = 12, height = 8, units = "in", res = 300
)

par(mfrow = c(2, 4), lwd = .1)

pwalk(list(ratio_dist, color, dim), function(x, colors, dim) {
    hist(
        x,
        col = colors,
        main = paste0("Dimension: ", dim),
        xlab = paste0(
            "Euclidean distance / Max distance\n",
            "SD = ", signif(sd(x), 2)
        ),
        xlim = c(0, 1),
        freq = FALSE
    )
})

dev.off()

par(mfrow = c(1, 1), lwd = 1)