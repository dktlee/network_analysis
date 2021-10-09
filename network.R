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


#######################################                                        #########################################
network_edge
# return all vertices 
V(network_edge)

# return all edges
E(network_edge)

# total number 
gorder(network_edge)
gsize(network_edge)



##########################################           iGRAPH OBJECT          ############################################
# Creating an igraph object
# Here you will learn how to create an igraph 'object' from data stored in an edgelist. 
# The data are friendships in a group of students. You will also learn how to make a basic visualization of the network.
# 
# Each row of the friends dataframe represents an edge in the network.

# Inspect the first few rows of the dataframe 'friends'
friends <- data.frame(
  name1 = c("Jessie","Jessie","Sidney","Sidney","Karl","Sidney","Britt","Shayne","Sidney","Sidney","Jessie",
            "Donnie","Sidney","Rene","Shayne","Jessie","Rene","Elisha","Eugene","Berry","Odell","Odell","Britt",
            "Elisha","Lacy","Britt","Karl"),
  name2 = c("Sidney","Britt","Britt","Donnie","Berry","Rene","Rene","Sidney","Elisha","Whitney","Whitney",
            "Odell","Odell","Whitney","Donnie","Lacy","Lacy","Eugene","Jude","Odell","Rickie","Karl","Lacy","Jude",
            "Whitney","Whitney","Tommy")
  )

# Convert friends dataframe to a matrix
friends.mat <- as.matrix(friends)

# Convert friends matrix to an igraph object
g <- graph.edgelist(friends.mat, directed = FALSE)

# Make a very basic plot of the network
plot(g)

# Subset vertices and edges
V(g)
E(g)

# Count number of edges
gsize(g)

# Count number of vertices
gorder(g)


######################################           ATTRIBUTES & SUBSETTING          ######################################

genders <- c("M", "F", "F", "M", "M", "M", "F", "M", "M", "F", "M", "F", "M", "F", "M", "M")
ages <- c(18, 19, 21, 20, 22, 18, 23, 21, 22, 20, 20, 22, 21, 18, 19, 20)

# Create new vertex attribute called 'gender'
g <- set_vertex_attr(g, "gender", value = genders)

# Create new vertex attribute called 'age'
g <- set_vertex_attr(g, "age", value = ages)

# View all vertex attributes in a list
vertex_attr(g)

# View attributes of first five vertices in a dataframe
V(g)[[1:5]] 


hours <- c(1,2,2,1,2,5,5,1,1,3,2,1,1,5,1,2,4,1,3,1,1,1,4,1,3,3,4)

# Create new edge attribute called 'hours'
g <- set_edge_attr(g, "hours", value = hours)

# View edge attributes of graph object
edge_attr(g)

# Find all edges that include "Britt"
E(g)[[inc('Britt')]]  

# Find all pairs that spend 4 or more hours together per week
E(g)[[hours>=4]]  



######################################           VISUALIZING ATTRIBUTES          #######################################

friends1_edges <- data.frame(
  name1 = c("Joe","Joe","Joe","Erin","Kelley","Ronald","Ronald","Ronald","Michael","Michael","Michael","Valentine",
            "Troy","Troy","Jasmine","Jasmine","Juan","Carey","Frankie","Frankie","Micheal","Micheal","Keith","Keith",
            "Gregory"),
  name2 = c("Ronald","Michael","Troy","Kelley","Valentine","Troy","Perry","Jasmine","Troy","Jasmine","Juan","Perry",
            "Jasmine","Juan","Juan","Carey","Demetrius","Frankie","Micheal","Merle","Merle","Alex","Marion",
            "Gregory","Marion"),
  hours = c(1,3,2,3,5,1,3,5,2,1,3,5,3,2,6,1,2,2,1,1,2,1,1,3,2)
)

friends1_nodes <- data.frame(
  name = c("Joe","Erin","Kelley","Ronald","Michael","Valentine","Troy","Jasmine","Juan","Carey","Frankie","Micheal",
           "Keith","Gregory","Perry","Demetrius","Merle","Alex","Marion"),
  gender = c("M","F","F","M","M","F","M","F","M","F","F","M","M","M","M","M","M","F","F")
)

g1 <- graph_from_data_frame(d = friends1_edges, vertices = friends1_nodes, directed = FALSE)

# Subset edges greater than or equal to 5 hours
E(g1)[[hours>=5]]  

# Set vertex color by gender
V(g1)$color <- ifelse(V(g1)$gender == "F", "orange", "dodgerblue")

# Plot the graph
plot(g1, vertex.label.color = "black")



#########################################           NETWORK LAYOUTS          ###########################################

# Plot the graph object g1 in a circle layout
plot(g1, vertex.label.color = "black", layout = layout_in_circle(g1))

# Plot the graph object g1 in a Fruchterman-Reingold layout 
plot(g1, vertex.label.color = "black", layout = layout_with_fr(g1))

# Plot the graph object g1 in a Tree layout 
m <- layout_as_tree(g1)
plot(g1, vertex.label.color = "black", layout = m)

# Plot the graph object g1 using igraph's chosen layout 
m1 <- layout_nicely(g1)
plot(g1, vertex.label.color = "black", layout = M1)

# Create a vector of weights based on the number of hours each pair spend together
w1 <- E(g1)$hours

# Plot the network varying edges by weights
m1 <- layout_nicely(g1)
plot(g1, 
     vertex.label.color = "black", 
     edge.color = 'black',
     edge.width = w1,
     layout = m1)


# Create a new igraph object by deleting edges that are less than 2 hours long 
g2 <- delete_edges(g1, E(g1)[hours < 2])


# Plot the new graph 
w2 <- E(g2)$hours
m2 <- layout_nicely(g2)

plot(g2, 
     vertex.label.color = "black", 
     edge.color = 'black',
     edge.width = w2,
     layout = m2)



