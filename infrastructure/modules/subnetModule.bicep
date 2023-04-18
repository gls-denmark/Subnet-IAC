param location string
param subnetName string
param vnetRG string
param vnetName string
param environmentName string
param adressPrefix string
param routeTable string
param natGateway string

resource newSubnet 'Microsoft.Network/virtualNetworks/subnets@2022-09-01' = {
  name: '${vnetName}/SubnetNameKVI'
  properties:{
    routeTable: {
      id: routeTable
    }
    natGateway: {
      id: natGateway
    }
    addressPrefix: adressPrefix
     }
}
