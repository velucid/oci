#/bin/bash

echo "##### install linux tools #####"
echo ""

apt install -y default-jre

echo "##### update python package #####"
echo ""

pip install --upgrade pip
pip install numpy matplotlib pandas
pip install jupyter-client grpcio protobuf 
pip install ipython ipykernel 
#pip3 install --upgrade ipython

echo "##### install spark #####"
echo ""

cd /opt
wget https://mirror.navercorp.com/apache/spark/spark-2.4.8/spark-2.4.8-bin-hadoop2.7.tgz
tar -xvf spark-2.4.8-bin-hadoop2.7.tgz
mv spark-2.4.8-bin-hadoop2.7 spark
rm -f spark-2.4.8-bin-hadoop2.7.tgz

echo "##### install zeppelin #####"
echo ""

cd /opt
wget https://mirror.navercorp.com/apache/zeppelin/zeppelin-0.9.0/zeppelin-0.9.0-bin-all.tgz
tar -xvf zeppelin-0.9.0-bin-all.tgz
mv zeppelin-0.9.0-bin-all zeppelin
rm -f zeppelin-0.9.0-bin-all.tgz

echo "##### config zeppelin #####"
echo ""

cp /opt/zeppelin/conf/zeppelin-env.sh.template /opt/zeppelin/conf/zeppelin-env.sh
echo "" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export SPARK_HOME=/opt/spark" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export PYSPARK_PYTHON=/usr/bin/python" >> /opt/zeppelin/conf/zeppelin-env.sh
echo "export ZEPPELIN_ADDR=0.0.0.0" >> /opt/zeppelin/conf/zeppelin-env.sh

echo "##### setup environment #####"
echo ""
 
echo "" >> ~/.bash_profile
echo "export SPARK_HOME=/opt/spark" >> ~/.bashrc
echo "export ZEPPELIN_HOME=/opt/zeppelin" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "export PATH=\$PATH:\$ZEPPELIN_HOME/bin:\$SPARK_HOME/bin" >> ~/.bashrc
source ~/.bashrc

echo "##### setup completed #####"