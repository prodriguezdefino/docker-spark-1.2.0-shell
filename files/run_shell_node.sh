#!/bin/bash
#

MASTER_NODE=$1

echo " "
echo " "
echo "****************************"
echo "* Apache Spark Shell Node *"
echo "****************************"
echo " "

echo " "
echo "Environment Variables: "
echo " "
env

IP=$(ip -o -4 addr list eth0 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }')
echo " "
echo "NODE_IP=$IP"
echo " "

## configure the hadoop and spark installations
echo " "
echo "Preparing Apache Spark..."
echo " "
sed s/HOSTNAME/$MASTER_NODE/ $HADOOP_PREFIX/etc/hadoop/core-site.xml.template > $HADOOP_PREFIX/etc/hadoop/core-site.xml
sed s/HOSTNAME/$MASTER_NODE/ $HADOOP_PREFIX/etc/hadoop/yarn-site.xml.template > $HADOOP_PREFIX/etc/hadoop/yarn-site.xml
sed "s/__MASTER__/$MASTER_NODE/;s/__HOSTNAME__/$HOSTNAME/;s/__LOCAL_IP__/$IP/" /tmp/spark-files/spark-env.sh.template > $SPARK_HOME/conf/spark-env.sh
sed s/HOSTNAME/$MASTER_NODE/ $SPARK_HOME/yarn-remote-client/core-site.xml.template > $SPARK_HOME/yarn-remote-client/core-site.xml
sed s/HOSTNAME/$MASTER_NODE/ $SPARK_HOME/yarn-remote-client/yarn-site.xml.template > $SPARK_HOME/yarn-remote-client/yarn-site.xml
chmod 755 $SPARK_HOME/conf/spark-env.sh

echo " "
echo "Starting Spark Shell..."
echo " "
. $SPARK_HOME/conf/spark-env.sh
$SPARK_HOME/bin/spark-shell --driver-memory 1g --executor-memory 1g --executor-cores 1
