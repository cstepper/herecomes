library('sf')
library('tibble')

name = c("Hotstepper", "SpinDoctor", "KingJames", "Hackerman", "DirtyDan")
x = c(11.056851, 11.05694, 11.05684, 11.05699, 11.056813)
y = c(49.484326, 49.48410, 49.48408, 49.48425, 49.484319)
youtube = c("eEJ2b6IaGWU",
            "wsdy_rct6uo",
            "ZgzebW6en-c",
            "KEkrWRHCDQU",
            "CN1OV9fh3uI")

crew = tibble::tibble(name, x, y, youtube)
crew = sf::st_as_sf(crew, coords = c("x", "y"), crs = 4326)

devtools::use_data(crew, overwrite = TRUE)

