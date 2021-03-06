shapiro1965 <- function(X) {
    ## Shapiro (1965)'s test of multivariate normality
    ## https://github.com/cran/mvShapiroTest/blob/master/R/mvshapiro.test.R
    
    X <- as.matrix(X)
    dname <- deparse(substitute(X))
    if(is.vector(X)==TRUE) X=cbind(X)
    stopifnot(is.matrix(X))
    n     <-  nrow(X)
    if (n < 12 || n > 5000) 
        return()
        #stop("Sample size must be between 12 and 5000.")
    p     <-  ncol(X)
    if(n<=p)
        stop("Sample size must be larger than vector dimension.")
    if(n>p)
    {
        x <- scale(X, scale = FALSE)
        eigenv <- eigen(var(X), symmetric = TRUE)
        e.vec   <-  as.matrix(eigenv$vectors)
        sqrS	<-  e.vec%*% diag(1/sqrt(eigenv$values),ncol=p) %*% t(e.vec)
        z <- t(sqrS%*%t(x))
        w <- rep(NA,p)
        for(k in 1:p)
        {
            w[k]  <- shapiro.test(z[,k])$statistic
        }
        wast <- mean(w)
        y <- log(n)
        w1 <- log(1-wast)
        m <- -1.5861-.31082*y-0.083751*y^2+.0038915*y^3
        s <- exp(-.4803-.082676*y+.0030302*y^2)
        s2 <- s^2
        sigma2 <- log((p-1+exp(s2))/p)
        mu1 <- m+s2/2-sigma2/2
        p.value <- pnorm(w1,mean=mu1,sd=sqrt(sigma2),lower.tail=FALSE) 

        results <- list(method = "Shapiro-Wilk (1965)",
                        doi = "https://doi.org/10.2307/2333709",
                        statistic = wast,
                        df = NA,
                        p.value = p.value)
        
        return(results)
    }
}
