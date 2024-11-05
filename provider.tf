# 테라폼 프로바이더 및 모듈에 대한 참고 링크 : https://registry.terraform.io/
# 여러 구독에 대한 관리 방법 가이드 참고 링크 : https://jeffbrown.tech/terraform-azure-multiple-subscriptions/
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.7.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.0.2"
    }
  }

  # Terraform 상태를 Azure Storage에 저장하기 위한 Backend 상태 구성
  # Terraform 상태를 로컬에 저장하면 팀 협업 환경에서 공유가 어렵기 때문에 Azure Storage 사용
  # https://docs.microsoft.com/ko-kr/azure/developer/terraform/store-state-in-azure-storage?tabs=azure-cli
  backend "azurerm" {
    resource_group_name  = "peterlah-rg"
    storage_account_name = "lswterraformstate0621"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    # access_key           = <스토리지계정이 프라이빗인 경우 액세스키> # 또는 환경변수 ARM_ACCESS_KEY 사용
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }

    /* Service Principal을 통한 인증 샘플
    subscription_id   = "<azure_subscription_id>"
    tenant_id         = "<azure_subscription_tenant_id>"
    client_id         = "<service_principal_appid>"
    client_secret     = "<service_principal_password>"
    */

    # export ARM_SUBSCRIPTION_ID=""
    # export ARM_CLIENT_ID="""
    # export ARM_CLIENT_SECRET=""
    # export ARM_TENANT_ID=""
  }
}

provider "azuread" {}
