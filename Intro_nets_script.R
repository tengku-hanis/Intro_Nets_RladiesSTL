library(igraphdata)
library(igraph)
data("UKfaculty")

class(UKfaculty)

plot(UKfaculty, 
     vertex.size = 5,
     vertex.color = "dodgerblue",
     vertex.frame.color= "dodgerblue",
     vertex.label.family = "Helvetica", 
     vertex.label.cex = 0.5,
     vertex.label.color = "black",
     edge.arrow.size = 0.01)

#### Exploring our Network ####

# Quick exploration of the network
UKfaculty

# Seeing if the graph has multiple edges per 
# the same pair of nodes or loops

is_simple(UKfaculty)

# Quick exploration of graph attributes

# Quick exploration of the vertex attributes
# first 5 vertices 

V(UKfaculty)[[1:5]]

#Look at distribution per attribute 

table(V(UKfaculty)$Group)

# Quick exploration of edge attributes

E(UKfaculty)[[1:5]]

#Look at distribution per attribute 
summary(E(UKfaculty)$weight)

# Does a given edge exist?

UKfaculty[57,52]
UKfaculty[1,2]

# Which nodes are connected to 57?
# For matrix one bracket 
# For just the names (a vector) use double brackets
UKfaculty[[57]]
UKfaculty[[57,]]

# Adding and removing edges 

UKfaculty[1, 2] <- TRUE
UKfaculty[1, 2] <- FALSE

# Select certain vertices 

#all vertices
V(UKfaculty)

#by name
V(UKfaculty)[1,2,28, 5:7]

#Select vertices that meet certain criteria
V(UKfaculty)[degree(UKfaculty) < 10]

UKfaculty[[1,]]
UKfaculty[[,1]]

# Selecting edges 

# Edges between two vertices regardless of the direction

E(UKfaculty)[57 %--% 70]

# Edges between two vertices taking into account direction

E(UKfaculty)[57 %->% 70]

E(UKfaculty)[57 %<-% 70]

# Edges along a path
# 
# P <- c(44,11)
# E(UKfaculty, path = P)

# Incoming edges of a vertex

E(UKfaculty)[to(57)]

# Outgoing edges of a vertex

E(UKfaculty)[from(57)]

#### Basics of Visualization ####
par(mar=c(0,0,0,0))
plot(UKfaculty)

# Setting visual properties inside the 
# plot function: as arguments of the funtion 

plot(UKfaculty, 
     # === vertex 
     vertex.color = "#DCE319FF",
     vertex.frame.color = "black",
     vertex.shape = "square",
     vertex.size = 4,
     # === vertex label
     vertex.label.family = "Helvetica",
     vertex.label.font = 3,
     vertex.label.cex = 0.5,
     vertex.label.degree = 0,
     # === edge
     edge.color = "gray",
     edge.width = 0.5,
     edge.arrow.size = 0.3,
     edge.arrow.width = 0.3,
     edge.curved = TRUE,
     edge.label.cex = 0.5)

# Setting visual properties outside the 
# plot function: as vertex and edge attributes 

V(UKfaculty)$color <- "dodgerblue"
E(UKfaculty)$color <- "gray"

plot(UKfaculty, 
     vertex.color = V(UKfaculty)$color, 
     edge.color = E(UKfaculty)$color, 
     edge.width = E(UKfaculty)$weight, 
     edge.arrow.size = 0.3,
     edge.arrow.width = 0.3)

# use selection tasks to help with
# coloring 

FL <- V(air)[grepl("FL$", City)]
CA <- V(air)[grepl("CA$", City)]

V(air)$color <- "grey"
V(air)[FL]$color <- "blue"
V(air)[CA]$color <- "blue"

# Graph Layouts 


#### Basic Statistics ####

# Density 
graph.density(UKfaculty)

is.connected(UKfaculty)

is.connected(UKfaculty, mode = "strong")



#### Centrality ####

# Degree

hist(degree(UKfaculty, mode = "in"))

degree(UKfaculty, mode = "out")

# Degree and plot


#### Community Detection ####

#### Basics of Visualization ####

