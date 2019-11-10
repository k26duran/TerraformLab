pipeline {

  agent any

  environment {
    ARM_SUBSCRIPTION_ID='5bce270c-15c2-4be1-82a2-675ffef48d33'
    ARM_CLIENT_ID='79d230b3-41df-482b-95e4-a915d338b0e3'
    ARM_CLIENT_SECRET='89a3f10e-aec4-4f90-ad16-5575df369ee3'
    ARM_TENANT_ID='50640584-2a40-4216-a84b-9b3ee0f3f6cf'
    ARM_ENVIRONMENT='public'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
        dir("ResourceGroup"){
          sh 'terraform init'
          sh 'terraform plan'
          sh 'terraform apply -auto-approve'
        }
      }
    }

    stage('Env') {
      steps {
        dir("TerraformLAB"){
          sh 'terraform init'
          sh 'terraform plan'
          sh 'terraform apply -auto-approve'
        }
      }
    }
  } 
}