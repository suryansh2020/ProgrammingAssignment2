# thread_id=684
## References
 # https://ramnathv.github.io/pycon2014-r/learn/functions.html
 # ?environment

# Running:
a<-c(1,2,3,4,5)
b<-makevector(a)
environment (b)
environment (b$set)

# ls() shows a and b (among other things), but:
ls()

environment (a)
environment (b)
# returns NULL in both cases.

environment (makeVector)

# returns the global environment. So what is this NULL environment?

######################################################################

# That's a good question. I'll try my best, hopefully this is helpful.

# We can see that a & b are in the global environment by
# calling a slightly different function.
exists("a", envir= .GlobalEnv) # TRUE
exists("b", envir= .GlobalEnv) # TRUE

# An explanation of exists() and environment() can be found by
# doing this:
# > ?environment

# I think the environment() function is asking a slightly different
# question.

f <- function() "top level function"

# All return the same thing
environment()
environment(f)
.GlobalEnv

# R has separate namespaces for functions & non-functions
# this is why a NULL value is returned for
environment(5)
environment(b)
environment(a)

# If we do this
c <- 100
(c + 1)

# Can we still use c() to concactenate vectors?
(x1 <- c(1:4))

# Yup. Hopefully this helps.





