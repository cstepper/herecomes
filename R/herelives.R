#' @title The Crew lives here
#'
#' @author Christoph Stepper
#' @author Tim Appelhans
#'
#' @param crowd \code{sf} data frame. Check the package data \emph{crew}
#'   to see the data structure.
#' @param all \code{logical}. Should all crew members be shown.
#'   If \code{FALSE}, user input is evaluated to create subset.
#'
#' @return \code{mapview} object.
#'
#'
#' @examples
#'   herelives(crew, all = TRUE)
#'
#' @importFrom mapview mapview
#' @importfFrom stringdist stringdistmatrix
#'
#' @export
herelives <- function(crowd = crew, all = FALSE) {

  options(viewer = NULL)

  if (all == TRUE) {

    crew_who = crew

  } else {

    who  = readline(prompt = "Which Crew Member(s) are you interested in? \n")

    # if input string has lenght 1, split input string by given delim and trim whitespace
    if (length(who) == 1) {
      who = gsub("\\.|;|-", ",", who)
      who = trimws(unlist(strsplit(who, split = ",")))
    }

    length_who = length(who)

    # use stringdistance to identify crew member
    dist_who = stringdist::stringdistmatrix(who, crew$name)
    keep_who = apply(dist_who, 1, which.min)

    # throw error if subset is not unambiguous
    stopifnot(length_who == length(keep_who))

    # do the subset
    crew_who = crew[keep_who, ]

  }

  # generate the map
  map = suppressWarnings(mapview::mapview(crew_who, zcol = "name",
                         popup = lapply(crew_who$url, mapview:::popupIframe)))

}

