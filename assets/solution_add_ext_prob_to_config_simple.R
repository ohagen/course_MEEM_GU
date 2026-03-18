# use browser
if (length(abundance)>2){browser()}

# imagine we have 50 species
n_sp <- 50

#generate some random abundance from a poisson distribution with lambda=10
abundance <- rpois(n_sp, lambda=10)

#imagine this is the niche width of all of them.. just for simplicity
niche_width <- rep(3, n_sp)

# and this is the already diff between the mean temp and the optimal temp...
# I'm testing here from 0 until 15...
# note that there is no negative diff since we take the abs of the subtraction
diff <- seq(0,15,length.out=50)

# If I divide this by niche_width, I get the probability of extinction!... 
# because at the niche width, I get 1.. i.e. x/x=1
prob_ext <- diff/niche_width
# set prob bigger than one to one
prob_ext[prob_ext>1] <- 1

# draw from a rbinomial distribution to see if the species goes extinct or not...
extinct <- rbinom(n_sp, size=1, prob=prob_ext)
# Julia, Vivien... try only a rbinom(n_sp, size=1, prob=prob_ext) and you will 
# see that the extinction is certain when diff is bigger or equal to the niche width... 
# and that it is zero when the diff is zero...
# we could even 

abundance[as.logical(extinct)] <- 0

return(abundance)

# we could do all sort of complicated things here now, like adding an extinction
# background rate or add fluctuations to species with low abundances.

# ----------
# another solution, if we would have a growth mechanisms (i.e. that increases abundances
# could be to subtract a binomial with size equal to the abundance...
abundance <- abundance-rbinom(n_sp, size=abundance, prob=prob_ext)
return(abundance)