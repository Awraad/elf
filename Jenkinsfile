pipeline {
      agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: kubectl
    image: bryandollery/terraform-packer-aws-alpine
    command:
    - cat
    tty: true
  - name: helm
    image: alpine/helm
    command:
    - cat
    tty: true
"""
    }
  }
  environment {
    TOKEN=credentials('823af0c8-8029-46db-9041-ad80c144bcb6')
  }

    stages {
      stage("Deploy") {
          steps {
              container('kubectl') {
                  sh '''
			source elf.sh
			kubectl --token=$TOKEN get all -n elf
			kubectl --token=$TOKEN get pods
		      '''
              }
          }
      }
}
}
