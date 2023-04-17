// Target scope must be subscription to create RG from bicep
// Remember to add scope to all modules.
targetScope = 'subscription'

// Params //

@allowed([ 'prod', 'dev', 'test' ])
@description('Enviroment of the deployment.')
param environmentName string

@description('location of all resources')
param location string = 'westeurope'

param subnetName string

param subnetAddressPrefix string

// Existings vars //

var vnetRG = 'GLSDK-RG-Network-${environmentName}'
var vnetName = 'GLSDK-VNET-${environmentName}'


// Existing Resources //


resource extVnet 'Microsoft.Network/virtualNetworks@2022-05-01'  existing = {
  name: vnetName
  scope: resourceGroup(vnetRG)
}

// resource extSubnet 'Microsoft.Network/virtualNetworks/subnets@2022-01-01' existing = {
//   name: SubnetName
//   parent: extVnet
// }

// Create RG //

module Network 'modules/subnetModule.bicep' = {
  scope: resourceGroup(vnetRG)
  name: 'deploySubnet'
  params: {
    environmentName: environmentName
    location: location
    subnetName: subnetName
    vnetName: vnetName
    vnetRG: vnetRG
    adressPrefix: subnetAddressPrefix
  }
}



