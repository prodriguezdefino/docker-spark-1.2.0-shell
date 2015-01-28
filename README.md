## Apache Spark Shell node image for Docker

Based on [prodriguezdefino/spark-1.2.0-base](https://github.com/prodriguezdefino/docker-spark-1.2.0-base) image. 

This image is intended to run alongside with a cluster formed by one master node [image](https://github.com/prodriguezdefino/docker-spark-1.2.0-master) and as many worker node [images](https://github.com/prodriguezdefino/docker-spark-1.2.0-worker). 

The default CMD will load up a bash inside the container, running ```docker run -it --name=shell -h shell -p 4040:4040 --link=master:master --rm=true prodriguezdefino/spark-1.2.0-shell``` will spawn the container.

In order to start using the interactive shell, once inside the container, we can fire up ```$RUN_SPARK_SHELL master```. This will configure the shell to connect to our master node (linked by docker at spawn time) and get ready to run calculations across the cluster. 


