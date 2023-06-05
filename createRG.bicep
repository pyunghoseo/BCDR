// az deployment sub create --name BCDRDeploymentRG --location koreacentral --template-file createRG.bicep
targetScope='subscription'

param locationOrigin string = 'japaneast'
param locationDR string = 'japanwest'

param nameOrigin string = 'RG-BCDR-Origin'
param nameDR string = 'RG-BCDR-Target'

resource resourceGroupOrigin 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: nameOrigin
  location: locationOrigin
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
}

resource resourceGroupDR 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: nameDR
  location: locationDR
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
}

output resourceGroupOriginName string = resourceGroupOrigin.name
output resourceGroupDRName string = resourceGroupDR.name
