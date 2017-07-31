rm(list = ls())

## Set working directory
setwd("/Users/viveksridhar/Documents/Code/Python/linkcomm/")
dir <- getwd()

## Load packages
library(linkcomm)

## Read file (links in network are expressed as node1 <delimiter> node2)
df <- read.table("lesmis/lesmis.net")
head(df)

## Function to get link communities
# hcmethod has numerous arguments which result in very different graphs.
# It is important to understand these hierarchical clustering methods
# to be able to chose the right method for the right problem.
# getLinkCommunities also does a default dendrogram plot for you.
lc <- getLinkCommunities(df, hcmethod = "single")
print(lc)

## Plot a matrix depicting community membership (nodes on the column and 
# community ids on rows)
plot(lc, type = "members")

## Function to obtain communities completely nested within other communities
# (result is expressed as `offspring community` parent community)
getAllNestedComm(lc)

## Plot particular communities (based on community ids). This function
# can be used to visualise communities nested within other communities
# (use clusterids = c(parent community id, offspring community id) to do this)
plot(lc, type = "graph", clusterids = c(7,13))

## Relationship between communities (based on how many nodes they
# share after scoring pairwise similarities using Jaccard coefficient).
# The cutat argument allows you to chose a height to cut the dendrogram
# allowing further clustering of communities to obtain meta-communities
cr <- getClusterRelatedness(lc, hcmethod = "ward.D2", cutat = 1.2)

## The above meta-community generation can be automated using the
# meta.communities function. This is useful in case of large networks
# where hundreds of communities may be detected and collapsing them into
# fewer meta-communities makes it more tangible
mc <- meta.communities(lc, hcmethod = "ward.D2", deepSplit = 0)

## Calculate community centrality
# calculates the importance of a node in a network based on the number
# of communities to which it belongs (nodes belonging to a lot of 
# communities have a high community centrality while nodes belonging to
# overlapping, nested or few communities will get low community centrality
# scores)
cc <- getCommunityCentrality(lc)
head(cc)
head(lc$numclusters)

## Community modularity and connectedness
# calculated based on relative number of links within vs links outside
# community. Connectedness is the inverse of modularity
cm <- getCommunityConnectedness(lc, conn = "modularity")
plot(lc, type = "commsumm", summary = "modularity")
