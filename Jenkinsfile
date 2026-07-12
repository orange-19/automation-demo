pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Verify Workspace') {
            steps {
                sh '''
                    echo "Current Directory:"
                    pwd

                    echo "Repository Files:"
                    ls -R
                '''
            }
        }

        stage('List Changed Files') {
            steps {
                sh '''
                    if git rev-parse HEAD~1 >/dev/null 2>&1; then
                        echo "Changed Files:"
                        git diff --name-only HEAD~1 HEAD
                    else
                        echo "First build. No previous commit."
                    fi
                '''
            }
        }

        stage('Test Ansible Connectivity') {
            steps {
                sh '''
                    ansible -i devops/inventory.ini slaves -m ping
                '''
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                sh '''
                    ansible-playbook \
                    -i devops/inventory.ini \
                    devops/playbooks/nginx.yml
                '''
            }
        }

    }
}