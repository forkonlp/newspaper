finish <- function(dat, func) {
  match.fun(func)(dat)
}

read <- function(func) {
  match.fun(func)
}
