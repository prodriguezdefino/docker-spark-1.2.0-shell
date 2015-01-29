## Apache Spark Shell node image for Docker

Based on [prodriguezdefino/sparkbase](https://github.com/prodriguezdefino/docker-spark-base) image. 

This image is intended to run alongside with a cluster formed by one master node [image](https://github.com/prodriguezdefino/docker-spark-master) and as many worker node [images](https://github.com/prodriguezdefino/docker-spark-worker). 

The default CMD will load up a bash inside the container, running ```docker run -it --name=shell -h shell -p 4040:4040 --link=master:master --rm=true prodriguezdefino/sparkshell``` will spawn the container (it should be assured that master, shell and worker must be reacheable between each other).

In order to start using the interactive shell, once inside the container, we can fire up ```$RUN_SPARK_SHELL master``` (where master is the url of the Spark master node). This will configure the shell to connect to our master node (linked by docker at spawn time) and get ready to run calculations across the cluster. 


