library('sf')
library('tibble')

name = c("Hotstepper", "SpinDoctor", "KingJames", "Hackerman")
x = c(11.05683, 11.05694, 11.05684, 11.05699)
y = c(49.48430, 49.48410, 49.48408, 49.48425)
url = c("https://www.youtube.com/embed/eEJ2b6IaGWU?autoplay=1",
        "https://www.youtube.com/embed/wsdy_rct6uo?autoplay=1",
        "https://www.youtube.com/embed/ZgzebW6en-c?autoplay=1",
        "https://www.youtube.com/embed/KEkrWRHCDQU?autoplay=1")

crew = tibble::tibble(name, x, y, url)
crew = sf::st_as_sf(crew, coords = c("x", "y"), crs = 4326)

devtools::use_data(crew, overwrite = TRUE)

