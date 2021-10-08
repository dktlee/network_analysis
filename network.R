########################################################################################################################
#                                                                                                                      #
# Author: Dylan Lee                                                                                                    #  
# Date: 2021-10-08                                                                                                     #
#                                                                                                                      #
# https://www.r-graph-gallery.com/network.html                                                                         #
########################################################################################################################


# Library
library(igraph)


##########################################          ADJACENCY MATRIX          ##########################################
# An adjacency matrix is a square matrix where entities in rows and columns are the same.                              

# Create data
set.seed(17)
data_adj <- matrix(sample(0:2, 25, replace=TRUE), nrow=5)
colnames(data_adj) = rownames(data_adj) = LETTERS[1:5]

# build the graph object
network_adj <- graph_from_adjacency_matrix(data_adj)

# plot it
plot(network_adj)
########################################################################################################################


##########################################          INCIDENCE MATRIX          ##########################################
# An incidence matrix is not necessarily square and entities provided in rows and columns are not always the same.

# Create data
data_inc <- matrix(sample(0:2, 15, replace=TRUE), nrow=3)
colnames(data_inc) <- letters[1:5]
rownames(data_inc) <- LETTERS[1:3]

# build the graph object
network_inc <- graph_from_incidence_matrix(data_inc)

# plot it
plot(network_inc)
########################################################################################################################


############################################           EDGE LIST          ##############################################
# An edge list has 2 columns. Each row represents a connection between an origin and a destination. 

# Create data 
data_edge <- data.frame(
  source = c("A","A", "A", "A", "A","F", "B"),
  target=c("B","B", "C", "D", "F","A","E")
  )

# build the graph object 
network_edge <- graph_from_data_frame(d=data_edge, directed=F)

# plot if 
plot(network_edge)
########################################################################################################################




#######################################           PLOTTING PARAMETERS          #########################################
set.seed(1)
data <- matrix(sample(0:1, 100, replace=T, prob=c(0.8,0.2)), nc=10)
network <- graph_from_adjacency_matrix(data, mode='undirected', diag=F)
par(mar=c(0,0,0,0))
plot(network)

# when several values are provided to an option, values are used subsequently and recycled.
plot(network,
     vertex.color = rgb(0.8,0.2,0.2,0.9),           # Node color
     vertex.frame.color = "Forestgreen",            # Node border color
     vertex.shape=c("circle","square"),             # One of “none”, “circle”, “square”, “csquare”, “rectangle” “crectangle”, “vrectangle”, “pie”, “raster”, or “sphere”
     vertex.size=c(15:24),                          # Size of the node (default is 15)
     vertex.size2=NA,                               # The second size of the node (e.g. for a rectangle)
)

plot(network,
     vertex.label=LETTERS[1:10],                    # Character vector used to label the nodes
     vertex.label.color=c("red","blue"),
     vertex.label.family="Times",                   # Font family of the label (e.g.“Times”, “Helvetica”)
     vertex.label.font=c(1,2,3,4),                  # Font: 1 plain, 2 bold, 3 italic, 4 bold italic, 5 symbol
     vertex.label.cex=c(0.5,1,1.5),                 # Font size (multiplication factor, device-dependent)
     vertex.label.dist=0,                           # Distance between the label and the vertex
     vertex.label.degree=0,                         # The position of the label in relation to the vertex (use pi)
)

plot(network,
     edge.color=rep(c("red","pink"),5),            # Edge color
     edge.width=seq(1,10),                         # Edge width, defaults to 1
     edge.arrow.size=1,                            # Arrow size, defaults to 1
     edge.arrow.width=1,                           # Arrow width, defaults to 1
     edge.lty=c("solid")                           # Line type, could be 0 or “blank”, 1 or “solid”, 2 or “dashed”, 3 or “dotted”, 4 or “dotdash”, 5 or “longdash”, 6 or “twodash”
     #edge.curved=c(rep(0,5), rep(1,5))            # Edge curvature, range 0-1 (FALSE sets it to 0, TRUE to 0.5)
)

par(bg="black")
plot(network, 
     
     # === vertex
     vertex.color = rgb(0.8,0.4,0.3,0.8),          # Node color
     vertex.frame.color = "white",                 # Node border color
     vertex.shape="circle",                        # One of “none”, “circle”, “square”, “csquare”, “rectangle” “crectangle”, “vrectangle”, “pie”, “raster”, or “sphere”
     vertex.size=14,                               # Size of the node (default is 15)
     vertex.size2=NA,                              # The second size of the node (e.g. for a rectangle)
     
     # === vertex label
     vertex.label=LETTERS[1:10],                   # Character vector used to label the nodes
     vertex.label.color="white",
     vertex.label.family="Times",                  # Font family of the label (e.g.“Times”, “Helvetica”)
     vertex.label.font=2,                          # Font: 1 plain, 2 bold, 3, italic, 4 bold italic, 5 symbol
     vertex.label.cex=1,                           # Font size (multiplication factor, device-dependent)
     vertex.label.dist=0,                          # Distance between the label and the vertex
     vertex.label.degree=0 ,                       # The position of the label in relation to the vertex (use pi)
     
     # === Edge
     edge.color="white",                           # Edge color
     edge.width=4,                                 # Edge width, defaults to 1
     edge.arrow.size=1,                            # Arrow size, defaults to 1
     edge.arrow.width=1,                           # Arrow width, defaults to 1
     edge.lty="solid",                             # Line type, could be 0 or “blank”, 1 or “solid”, 2 or “dashed”, 3 or “dotted”, 4 or “dotdash”, 5 or “longdash”, 6 or “twodash”
     edge.curved=0.3    ,                          # Edge curvature, range 0-1 (FALSE sets it to 0, TRUE to 0.5)
)
