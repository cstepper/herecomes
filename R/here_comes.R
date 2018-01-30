#' @title Here comes the Hotstepper
#'
#' @author Christoph Stepper
#'
#' @param who \code{character}; at the moment one of:
#'   \itemize{
#'   \item HotStepper
#'   \item SpinDoctor
#'   \item KingJames
#'   \item Hackerman
#'   \item Dirtydan}
#'
#' @examples
#'   here_comes("Hotstepper")
#'
#' @importFrom utils browseURL
#'
#' @export
here_comes <- function(who = c("Hotstepper", "SpinDoctor", "KingJames", "Hackerman", "Dirtydan")) {

  who = match.arg(who)

  switch(who,
         Hotstepper = {url = "https://www.youtube.com/watch?v=eEJ2b6IaGWU"},
         SpinDoctor = {url = "https://www.youtube.com/watch?v=wsdy_rct6uo"},
         KingJames = {url = "https://www.youtube.com/watch?v=ZgzebW6en-c"},
         Hackerman = {url = "https://www.youtube.com/watch?v=KEkrWRHCDQU"},
         Dirtydan = {url = "https://www.youtube.com/watch?v=CN1OV9fh3uI"},)

  browseURL(url = url)
}
