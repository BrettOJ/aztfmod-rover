
# Creates an Azure AKS cluster

creates a aks cluster in the specified region.

Reference the module to a specific version (recommended):

```hcl
module "azurerm_kubernetes_cluster" {

    source  = "aztfmod/caf-kubernetes-cluster/azurerm"
    version = "0.1.0"
  
      dns_prefix          = "aks-${var.app_name}-${var.env}-${local.random}"
      resource_group_name = var.resource_group_name
      location            = var.location
      node_resource_group = var.aks_node_rg
      admin_username = var.linux_admin_username

```

Or get the latest version

```hcl

module "azurerm_kubernetes_cluster" {

    source  = "aztfmod/caf-kubernetes-cluster/azurerm"
      dns_prefix          = "aks-${var.app_name}-${var.env}-${local.random}"
      resource_group_name = var.resource_group_name
      location            = var.location
      node_resource_group = var.aks_node_rg
      admin_username = var.linux_admin_username

}
```

# Parameters

## resource_groups

(Required) Object that describes the resource groups to be created with their geo.
Global group of tags will be added to all RG, specific tags can be added per RG.

```hcl
variable "resource_group_name" {
  description = "(Required) Name of the resource group where to create the aks"
  type        = string
}
```

```hcl
variable "aks_cluster_name" {
  description = "Name of the aks cluster"
}
```
 
```hcl


```

```hcl


```

```hcl

```

## prefix

(Optional) You can use a prefix to add to the list of resource groups you want to create

```hcl

```

Example

```hcl



```

# Output

## object

Returns the full set of created resource groups as a map, as follows:

```hcl







```
