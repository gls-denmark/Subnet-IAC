param location string
param subnetName string
param vnetRG string
param vnetName string
param environmentName string
param adressPrefix string


resource extVnet 'Microsoft.Network/virtualNetworks@2022-05-01'  existing = {
  name: vnetName
  scope: resourceGroup(vnetRG)
}

resource extRouteTable 'Microsoft.Network/routeTables@2022-09-01' existing = {
  name: 'GLSDK-RT-${environmentName}'
  scope: resourceGroup('glsdk-rg-network-${environmentName}')
}

resource extNatGateway 'Microsoft.Network/natGateways@2022-09-01' existing = {
  name: 'GLSDK-NG-${environmentName}'
  scope: resourceGroup('glsdk-rg-network-${environmentName}')
}

resource newSubnet 'Microsoft.Network/virtualNetworks/subnets@2022-09-01' = {
  name: '${extVnet}/SubnetNameKVI'
  properties:{
    natGateway: extNatGateway
    routeTable: extRouteTable
    addressPrefix: adressPrefix
  }
}
