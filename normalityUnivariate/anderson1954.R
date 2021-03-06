anderson1954 <- function (x){
    ## The Anderson and Darling's (1954) test of normality
    ## https://github.com/cran/nortest/blob/master/R/ad.test.R

    x <- sort(x[complete.cases(x)])
    n <- length(x)

    if (n < 8)
    {
      stop("sample size must be greater than 7")
    }
    
    logp1 <- pnorm( (x-mean(x))/sd(x), log.p=TRUE)
    logp2 <- pnorm( -(x-mean(x))/sd(x), log.p=TRUE )
    h <-  (2 * seq(1:n) - 1) * (logp1 + rev(logp2)) 
    
    A <- -n - mean(h)
    AA <- (1 + 0.75/n + 2.25/n^2) * A

    if (AA < 0.2)
    {
      pval <- 1 - exp(-13.436 + 101.14 * AA - 223.73 * AA^2)
    }
    else if (AA < 0.34)
    {
      pval <- 1 - exp(-8.318 + 42.796 * AA - 59.938 * AA^2)
    }
    else if (AA < 0.6)
    {
      pval <- exp(0.9177 - 4.279 * AA - 1.38 * AA^2)
    }
    else if (AA < 10)
    {
      pval <- exp(1.2937 - 5.709 * AA + 0.0186 * AA^2)
    } 
    else
    {
        pval <- 3.7e-24
    }

    result <- list(method = "Anderson-Darling (1954)",
                   doi = "https://doi.org/10.1007/978-3-642-04898-2_118",
                   statistic = A,
                   df = NA,
                   p.value = pval)

    return(result)
}
