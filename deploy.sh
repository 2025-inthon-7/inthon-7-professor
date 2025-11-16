flutter build web --release --base-href /app/professor/
cd build/web
scp -r * EC2@34.50.32.200:~/flutter-web-temp/
ssh EC2@34.50.32.200 "cd ~/flutter-web-temp && sudo rm -rf /srv/professor/* && sudo mv * /srv/professor/"
cd ../..