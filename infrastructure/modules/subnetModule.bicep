param location string
param subnetName string
param vnetRG string
param vnetName string
param environmentName string
param adressPrefix string
param routeTable string

resource extNatGateway 'Microsoft.Network/natGateways@2022-09-01' existing = {
  name: 'GLSDK-NG-${environmentName}'
  scope: resourceGroup('glsdk-rg-network-${environmentName}')
}

resource newSubnet 'Microsoft.Network/virtualNetworks/subnets@2022-09-01' = {
  name: '${vnetName}/SubnetNameKVI'
  properties:{
    natGateway: extNatGateway
    addressPrefix: adressPrefix
    routeTable: routeTable
  }
}
