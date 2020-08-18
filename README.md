# Percolation-Model
This repository contains the codes for simulation of 2D percolation.

### Description
Percolation theory is a highly developed subfield of statistical physics and mathematics. In square lattice we place pebbles with probability p at each intersection. Neighboring pebbles are considered connected, forming clusters of size two or more Obviously, the higher is p, the larger are the clusters. A key prediction of percolation theory is that the cluster size does not change gradually with p. Rather, for a wide range of p the lattice is populated with numerous tiny clusters If p approaches a critical value pc, these small clusters grow and coalesce, leading to the emergence of a large cluster at pc. We call this the percolating cluster as it reaches the end of the lattice. In other words, at pc we observe a phase transition from many small clusters to a percolating cluster that percolates the whole lattice (for a square lattice pc ≈ 0.593 (d = 2)).

reference:
[The Network Science](https://barabasi.com/book/network-science)

### Codes
In file `Percolation2D` we simulate the percolation in square lattice and we calculate the variation of Giant cluster and Mean Cluster size.

In order to get a smooth continious diagram, we use `Percolation2D_KERNEL` as a Kernel smoother.
