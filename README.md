#Run cucumber test with sanity tags
cucumber --tags @sanity

#Run cucumber test other than sanity tag
cucumber --tags ~@sanity

#Run cucumber test of different tags
cucumber --tags @TC001,@TC006

#Start Jenkins
sudo /etc/init.d/jenkins start
http://localhost:8080/jenkins

