#Run cucumber test with sanity tags
cucumber --tags @sanity

#Run cucumber test other than sanity tag
cucumber --tags ~@sanity

#Run cucumber test of different tags
cucumber --tags @TC001,@TC006

#Start Jenkins
sudo /etc/init.d/jenkins start
http://localhost:8080/jenkins
/var/lib/jenkins/secrets/initialAdminPassword

#Generate Reports
cucumber --tags @sanity features --format html --out reports

#Rerun feature
cucumber features/retest.feature -f pretty -f rerun --out rerun.txt || cucumber @rerun.txt
