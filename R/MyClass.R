

# This also doesn't seem to work:
# https://stackoverflow.com/questions/59636438/how-to-dispatch-summary-method-in-r6-object

#' A Test R6 Class
#'
#' @export
#' @import R6
MyClass <- R6::R6Class(
  "MyClass",
  public = list(
    #' @field a something
    a = 1,

    #' @description
    #' initializes the myclass object
    #' @param x object for a
    initialize = function(x) {
      self$a <-x
    },

    #' @description
    #' prints
    hello_world = function() {
      cat("Hello!")
    },

    #' @description
    #' summarizes
    summary = function() {
      cat("Summary!", self$a)
    },

    #' @description
    #' summarizes
    simulate = function() {
      cat("Simulates!", self$a)
    }

  )
)


#' Creates a new model
#' @param x a character
#' @return a new model
#' @export
#'
#' @examples
#' a <- my_class("abcd")
my_class <- function(x) {
  MyClass$new(x)
}

# not ideal, because overwrites all generics
#hello_world <- function(x) {
#  x$hello_world()
# }


hello_world <- function(x) {
  UseMethod("hello_world")
}

#' A sample method
#' @param x class object
#'
#' @param ... other parameters
#'
#' @export
hello_world.MyClass <- function(x, ...) {
  x$hello_world()
}


#' Summarizes the class object
#' @param object class object
#'
#' @param ... other parameters
#'
#' @export
summary.MyClass <- function(object,...) {
  object$summary()
}

#' Simulates the class object
#' @param object class object
#'
#' @param ... other parameters
#'
#' @export
#' @importFrom stats simulate
simulate.MyClass <- function(object,...) {
  object$simulate()
}

