param location string
param subnetName string
param vnetRG string
param vnetName string
param environmentName string
param adressPrefix string
param routeTable object
param natGateway object

resource newSubnet 'Microsoft.Network/virtualNetworks/subnets@2022-09-01' = {
  name: '${vnetName}/SubnetNameKVI'
  properties:{
    routeTable: routeTable
    natGateway: natGateway
    addressPrefix: adressPrefix
     }
}
