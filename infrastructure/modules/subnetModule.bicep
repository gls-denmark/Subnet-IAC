param location string
param subnetName string
param vnetRG string
param vnetName string
param environmentName string
param adressPrefix string
// param routeTable string
// param natGateway string

resource newSubnet 'Microsoft.Network/virtualNetworks/subnets@2022-09-01' = {
  name: '${vnetName}/SubnetNameKVI'
  properties:{
    natGateway: '/subscriptions/18a62d0a-27f5-431c-b9a4-51f85185708c/resourceGroups/GLSDK-RG-Network-Dev/providers/Microsoft.Network/natGateways/GLSDK-NG-Dev'
    addressPrefix: adressPrefix
    routeTable: '/subscriptions/18a62d0a-27f5-431c-b9a4-51f85185708c/resourceGroups/glsdk-rg-network-dev/providers/Microsoft.Network/routeTables/GLSDK-RT-Dev'
  }
}
