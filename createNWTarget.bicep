// az deployment group create --name BCDRDeploymentNWTarget --resource-group RG-BCDR-Target --template-file .\createNWTarget.bicep
param vNetSettings object = {
  name: 'targetVnet'
  location: 'japanwest'
  addressPrefixes: [
    {
      name: 'firstPrefix'
      addressPrefix: '172.17.0.0/16'
    }
  ]
  subnets: [
    {
      name: 'firstSubnet'
      addressPrefix: '172.17.0.0/24'
    }
    {
      name: 'secondSubnet'
      addressPrefix: '172.17.1.0/24'
    }
  ]
}

resource vnet 'Microsoft.Network/virtualNetworks@2020-06-01' = {
  name: vNetSettings.name
  location: vNetSettings.location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vNetSettings.addressPrefixes[0].addressPrefix
      ]
    }
    subnets: [
      {
        name: vNetSettings.subnets[0].name
        properties: {
          addressPrefix: vNetSettings.subnets[0].addressPrefix
        }
      }
      {
        name: vNetSettings.subnets[1].name
        properties: {
          addressPrefix: vNetSettings.subnets[1].addressPrefix
        }
      }
    ]
  }
}
