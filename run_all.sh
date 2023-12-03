
cd app/
docker compose up --build -d
cd ..
ansible-playbook linux/ansible/playbook.yml
