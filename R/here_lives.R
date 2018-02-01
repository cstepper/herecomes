#' @title The Crew lives here
#'
#' @author Christoph Stepper
#' @author Tim Appelhans
#'
#' @param crew \code{sf} data frame. Check the package data \emph{hottest_crew}
#'   to see the data structure.
#' @param all_members \code{logical}. Should all crew members be shown.
#'   If \code{FALSE}, user input is evaluated to create subset.
#'
#' @return \code{mapview} object.
#'
#'
#' @examples
#'   options(viewer = NULL)
#'   crew_map = here_lives(crew, all_members = TRUE)
#'   crew_map
#'
#'
#'
#' @importFrom mapview mapview
#' @importFrom stringdist stringdistmatrix
#'
#' @export
here_lives <- function(crew = hottest_crew, all_members = FALSE) {

  # subset data to relevant crew members
  crew_who = identify_crew_member(crew = crew, all_members = all_members)

  # build url
  crew_who$url <- paste0("https://www.youtube.com/embed/", crew_who$youtube, "?autoplay=1")


  # generate the map
  crew_map = suppressWarnings(mapview::mapview(crew_who, zcol = "name",
                              popup = lapply(crew_who$url, mapview:::popupIframe)))

}

