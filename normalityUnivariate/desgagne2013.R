desgagne2013 <- function(x){
  ## Test of Normality Against Generalized Exponential Power Alternatives
  ## https://github.com/cran/PoweR/blob/master/src/laws-stats/stats/stat35.cpp
  ## bilateral test that rejects H0 only for large values of the test statistic
  n <- length(x)
  varpopX <- r1 <- r2 <- r3<- 0
  y <- matrix(0,n,0)
  
  meanX <- mean(x)
  varpopX <- sum(x^2)
  
  varpopX <- varpopX/n-meanX^2
  sdX <- sqrt(varpopX)
  y <- (x - meanX)/sdX

  r1 <- sum(y^2 * log(abs(y)))
  r2 <- sum(log(1 + abs(y)))
  r3 <- sum(log(log( 2.71828182846 + abs(y))))
  
  r1 <- 0.18240929 - 0.5 * r1 / n
  r2 <- 0.5348223 - r2 / n
  r3 <- 0.20981558 - r3 / n

  Rn <- n * ((r1 * 1259.04213344 - r2 * 32040.69569026 + r3 * 85065.77739473) * r1 + (-r1 * 32040.6956903 + r2 * 918649.9005906 - r3 * 2425883.3443201) * r2 + (r1 * 85065.7773947 - r2 * 2425883.3443201 + r3 * 6407749.8211208) * r3)
  
   
  pvalCalc35 <- function(n,Rn){
    an <- bn <- cn <- 0.0
    if (n == 10) {an = -90.771; bn = 91.196 ; cn = -0.02;}
    if (n == 20) {an = -21.640; bn = 22.203; cn = -0.08;}
    if (n == 30) {an = -12.320; bn = 13.022; cn = -0.13;}
    if (n == 40) {an = -10.463; bn = 11.218; cn = -0.15;}
    if (n == 50) {an = -8.805; bn = 9.650; cn = -0.17;}
    if (n == 60) {an = -8.957; bn = 9.807; cn = -0.17;}
    if (n == 70) {an = -9.072; bn = 9.928; cn = -0.17;}
    if (n == 80) {an = -8.279; bn = 9.200; cn = -0.18;}
    if (n == 90) {an = -9.154; bn = 10.043; cn = -0.17;}
    if (n == 100) {an = -9.163; bn = 10.071; cn = -0.17;}
    if (n == 110) {an = -9.153; bn = 10.082; cn = -0.17;}
    if (n == 120) {an = -10.101; bn = 10.999; cn = -0.16;}
    if (n == 130) {an = -10.083; bn = 10.999; cn = -0.16;}
    if (n == 140) {an = -10.059; bn = 10.993; cn = -0.16;}
    if (n == 150) {an = -11.128; bn = 12.028; cn = -0.15;}
    if (n == 160) {an = -11.098; bn = 12.015; cn = -0.15;}
    if (n == 170) {an = -11.070; bn = 12.002; cn = -0.15;}
    if (n == 180) {an = -11.031; bn = 11.980; cn = -0.15;}
    if (n == 190) {an = -12.240; bn = 13.153; cn = -0.14;}
    if (n == 200) {an = -12.198; bn = 13.127; cn = -0.14;}
    if (n == 210) {an = -12.160; bn = 13.104; cn = -0.14;}
    if (n == 220) {an = -13.551; bn = 14.457; cn = -0.13;}
    if (n == 230) {an = -13.507; bn = 14.428; cn = -0.13;}
    if (n == 240) {an = -13.468; bn = 14.402; cn = -0.13;}
    if (n == 250) {an = -15.096; bn = 15.988; cn = -0.12;}
    if (n == 260) {an = -15.058; bn = 15.963; cn = -0.12;}
    if (n == 280) {an = -14.979; bn = 15.906; cn = -0.12;}
    if (n == 290) {an = -16.889; bn = 17.774; cn = -0.11;}
    if (n == 300) {an = -16.848; bn = 17.744; cn = -0.11;}
    if (n == 310) {an = -16.820; bn = 17.725; cn = -0.11;}
    if (n == 320) {an = -16.778; bn = 17.692; cn = -0.11;}
    if (n == 330) {an = -19.069; bn = 19.940; cn = -0.10;}
    if (n == 340) {an = -19.028; bn = 19.908; cn = -0.10;}
    if (n == 350) {an = -18.998; bn = 19.886; cn = -0.10;}
    if (n == 360) {an = -18.970; bn = 19.864; cn = -0.10;}
    if (n == 370) {an = -18.936; bn = 19.838; cn = -0.10;}
    if (n == 380) {an = -18.893; bn = 19.805; cn = -0.10;}
    if (n == 390) {an = -21.672; bn = 22.539; cn = -0.09;}
    if (n == 400) {an = -21.639; bn = 22.513; cn = -0.09;}
    if (n == 410) {an = -21.609; bn = 22.489; cn = -0.09;}
    if (n == 420) {an = -21.580; bn = 22.465; cn = -0.09;}
    if (n == 430) {an = -21.548; bn = 22.440; cn = -0.09;}
    if (n == 440) {an = -25.013; bn = 25.860; cn = -0.08;}
    if (n == 450) {an = -24.976; bn = 25.829; cn = -0.08;}
    if (n == 460) {an = -24.956; bn = 25.813; cn = -0.08;}
    if (n == 470) {an = -24.928; bn = 25.790; cn = -0.08;}
    if (n == 480) {an = -24.897; bn = 25.765; cn = -0.08;}
    if (n == 490) {an = -24.874; bn = 25.745; cn = -0.08;}
    if (n == 500) {an = -24.848; bn = 25.724; cn = -0.08;}
    if (n == 1000) {an = -54.342; bn = 55.166; cn = -0.04;}
    if (n > 1000) {an =  64.056; bn = -63.392; cn = 0.04;}
    
    if (an == 0) {				   
      return (NA)				   
    } else {					   
      return(((Rn - an) / bn)^(1.0 / cn))  
    }
    
  }
  
  pval <- pvalCalc35(n,Rn)
  result <- list(method = "Desgagne-Micheaux-Leblanc (2013)",
                 doi = "https://doi.org/10.1080/03610926.2011.577548",
                 statistic = Rn,
                 df = NA,
                 p.value = pval)
    
  return(result)
}
