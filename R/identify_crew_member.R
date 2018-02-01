#' @title Identify Crew Members
#'
#' @author Christoph Stepper
#'
#' @param crew \code{sf} data frame. Check the package data \emph{hottest_crew}
#'   to see the data structure.
#' @param all_members \code{logical}. Should all crew members be selected.
#'   If \code{FALSE}, user input is evaluated to create subset.
#'
#' @return \code{sf} data frame.
#'
#' @importFrom stringdist stringdistmatrix
#'
identify_crew_member <- function(crew = hottest_crew, all_members = FALSE) {

  if (all_members == TRUE) {

    crew_who = crew

  } else {

    # user input for crew members
    who  = readline(prompt = "Which Crew Member(s) are you interested in? \n")

    # if input string has length 1, split input string by given delim and trim whitespace
    if (length(who) == 1) {
      # substitute all punctuation charactes by space
      who = gsub("[[:punct:]]", " ", who)
      # trim whitespace if there would be any at the beginning or end of the string
      who = trimws(who, which = "both")

      # # make all space separator to nchar == 1
      # who = gsub("[[:space:]]+", " ", who)

      # split for single strings
      who = unlist(strsplit(who, split = "\\s+"))
    }

    # remove leading/trailing whitespace
    who = trimws(who, which = "both")

    length_who = length(who)

    # use stringdistance to identify crew member
    dist_who = stringdist::stringdistmatrix(a = who, b = crew$name)
    keep_who = apply(X = dist_who, MARGIN = 1, FUN = which.min)
    keep_who = unique(keep_who)


    # throw error if subset is not unambiguous
    stopifnot(length_who == length(keep_who))

    # do the subset
    crew_who = crew[keep_who, ]
  }

  return(crew_who)
}
