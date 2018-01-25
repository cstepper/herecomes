#' @title Here comes the Hotstepper
#'
#' @author Christoph Stepper
#'
#' @importFrom utils browseURL
#'
#' @export
herecomes <- function(what = c("Hotstepper", "IceIceBaby", "Hackerman")) {

  what = match.arg(what)

  switch(what,
         Hotstepper = {browseURL(url = "https://www.youtube.com/watch?v=eEJ2b6IaGWU")},
         IceIceBaby = {browseURL(url = "https://www.youtube.com/watch?v=rog8ou-ZepE")},
         Hackerman = {browseURL(url = "https://www.youtube.com/watch?v=KEkrWRHCDQU")})

}
