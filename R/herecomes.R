#' @title Here comes the Hotstepper
#'
#' @author Christoph Stepper
#' @example
#'   herecomes("Hotstepper")
#'
#' @importFrom utils browseURL
#'
#' @export
herecomes <- function(who = c("Hotstepper", "SpinDoctor", "KingJames", "Hackerman")) {

  who = match.arg(who)

  switch(who,
         Hotstepper = {browseURL(url = "https://www.youtube.com/watch?v=eEJ2b6IaGWU")},
         SpinDoctor = {browseURL(url = "https://www.youtube.com/watch?v=wsdy_rct6uo")},
         KingJames = {browseURL(url = "https://www.youtube.com/watch?v=ZgzebW6en-c")},
         Hackerman = {browseURL(url = "https://www.youtube.com/watch?v=KEkrWRHCDQU")})
}
