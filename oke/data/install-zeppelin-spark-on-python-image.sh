#!/bin/bash

#######################################
##### Install Open-Java 8         #####
#######################################

apt install -y openjdk-8-jdk

#######################################
##### Install Python 3.7          #####
#######################################

apt update -y
apt install -y python3.7
apt install -y python3.7-venv
python3.7 -m venv /opt/python
source /opt/python/bin/activate
apt install -y python3-pip
python3.7 -m pip install --upgrade pip
pip --version

#######################################
##### Install Python Packages     #####
#######################################

pip3 install ipython ipykernel
pip3 install keras tensorflow matplotlib
pip3 install scikit-learn pandas
#pip3 install jupyter-client grpcio protobuf
#pip3 install pyspark
#pip3 install --upgrade ipython

#######################################
##### Install Spark 2.4.8         #####
#######################################

cd /opt
wget https://mirror.navercorp.com/apache/spark/spark-2.4.8/spark-2.4.8-bin-hadoop2.7.tgz
tar -xvf spark-2.4.8-bin-hadoop2.7.tgz
mv spark-2.4.8-bin-hadoop2.7 spark
rm -f spark-2.4.8-bin-hadoop2.7.tgz

#######################################
##### Config Spark Environment    #####
#######################################

cp /opt/spark/conf/spark-env.sh.template /opt/spark/conf/spark-env.sh
echo "" >> /opt/spark/conf/spark-env.sh
echo "export PYTHON_HOME=/opt/python" >> /opt/spark/conf/spark-env.sh
echo "export SPARK_HOME=/opt/spark" >> /opt/spark/conf/spark-env.sh
echo "export PATH=/opt/python/bin:/opt/spark/bin:\$PATH" >> /opt/spark/conf/spark-env.sh
echo "" >> /opt/spark/conf/spark-env.sh

#######################################
##### Install Zeppelin            #####
#######################################

cd /opt
wget https://mirror.navercorp.com/apache/zeppelin/zeppelin-0.9.0/zeppelin-0.9.0-bin-all.tgz
tar -xvf zeppelin-0.9.0-bin-all.tgz
mv zeppelin-0.9.0-bin-all zeppelin
rm -f zeppelin-0.9.0-bin-all.tgz

#######################################
##### Config Zeppelin Environment #####
#######################################

cp /opt/zeppelin/conf/zeppelin-env.sh.template /opt/zeppelin/conf/zeppelin-env.sh
echo "" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export PYTHON_HOME=/opt/python" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export SPARK_HOME=/opt/spark" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export PYSPARK_PYTHON=/opt/python/bin/python" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export PYSPARK_DRIVER_PYTHON=/opt/python/bin/python" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export ZEPPELIN_ADDR=0.0.0.0" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export PATH=/opt/python/bin:/opt/zeppelin/bin:\$PATH" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "" >> /opt/zeppelin/conf/zeppelin-env.sh

#######################################
##### Setup Bash Environment      #####
#######################################

echo "export PYTHON_HOME=/opt/python" >> ~/.bashrc
echo "export SPARK_HOME=/opt/spark" >> ~/.bashrc
echo "export ZEPPELIN_HOME=/opt/zeppelin" >> ~/.bashrc
echo "export PATH=\$PYTHON_HOME/bin:\$ZEPPELIN_HOME/bin:\$SPARK_HOME/bin:\$PATH" >> ~/.bashrc
echo "" >> ~/.bashrc

###########################################
##### Zepplin/Pyspark Setup Completed #####
###########################################
