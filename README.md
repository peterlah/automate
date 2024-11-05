# 개요
- 테라폼을 통해 Azure 리소스를 정해진 시간에 생성 삭제 자동화 하기 위해 만든 코드
- 추가 Custom은 자유롭게 진행

# 1. Create Service Principal

```bash
# 내 구독 아이디로 변경
SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
# 내 sp 이름으로 변경
SP_NAME="terraform"

az ad sp create-for-rbac --name $SP_NAME --role "Contributor" --scopes "/subscriptions/${SUBSCRIPTION_ID}"
```

# 2. Create Storage Account

```bash
# 쉘파일 수정 필요(본인 스토리지 계정이름, 본인 리소스그룹이름)
./create_storage_account_script/create-storage.sh
```

# 3. Github Secrets 설정

```
# 1번 과정에서 생성한 정보 기반으로 아래 시크릿 생성
AZURE_CLIENT_ID
AZURE_CLIENT_SECRET
AZURE_TENANT_ID
AZURE_SUBSCRIPTION_ID
VM_ADMIN_PASSWORD # 본인 비번으로 생성
# 필요에 따라 추가 시크릿 생성
```

4. 생성한 스토리지 계정 정보 기반으로 파이프라인 수정(두개다 수정)
```
# .github/workflows/terraform-deploy.yml
# .github/workflows/terraform-destroy.yml
# 파이프라인 수정 필요(acount 이름, 리소스 그룹명 수정)
    - name: Terraform Init
      run: |
        terraform init \
          -backend-config="storage_account_name=lswterraformstate0621" \
          -backend-config="container_name=tfstate" \
          -backend-config="key=terraform.tfstate" \
          -backend-config="resource_group_name=peterlah-rg"
```

5. provider.tf 수정
```
# 백엔드 정보를 생성한 정보로 수정
  backend "azurerm" {
    resource_group_name  = "peterlah-rg"
    storage_account_name = "lswterraformstate0621"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
```

6. 테라폼 아웃풋 확인
![alt text](<create_storage_account_script/image.png>)
