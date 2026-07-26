fib_fibonacci <- function(n){
    if(n < 0) {
        stop("Input must be a non-negative integer.")
    }

    stopifnot("n must be a integer" = is.numeric(n),
              "n must be a ganzzahl" = n == floor(n))
    if(n == 0){
        return(0)
    }
    if(n == 1){
        return (1)
    }
    return(fib_fibonacci(n - 1) + fib_fibonacci(n - 2))
}

fib_fibonacci(35)
fib_fibonacci(5)
system.time(fib_fibonacci(35))["elapsed"]

fib_memo <- local({
    cache <- c("0" = 0, "1" = 1)

    function(n){
        if(n < 0) {
        stop("Input must be a non-negative integer.")
    }

        stopifnot("n must be a integer" = is.numeric(n),
                  "n must be a ganzzahl" = n == floor(n))
    

    key <- as.character(n)

    if(!is.na(cache[key])){
        return (unname(cache[key]))
    }

    result <- fib_memo(n - 1) + fib_memo(n - 2)
    cache[key] <<- result
    return(result)
    
}
})

fib_memo(35)
system.time(fib_memo(35))
