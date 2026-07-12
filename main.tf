terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "app" {
  name     = "${var.label_prefix}-h09-rg"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "app" {
  name                = "${var.label_prefix}-aks"
  location            = azurerm_resource_group.app.location
  resource_group_name = azurerm_resource_group.app.name
  dns_prefix          = "${var.label_prefix}-aks"

  default_node_pool {
    name                 = "default"
    vm_size              = var.node_vm_size
    auto_scaling_enabled = true
    min_count            = 1
    max_count            = 3
    node_count           = 1
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  tags = {
    Course     = "CST8918"
    Assignment = "Hybrid-H09"
    Student    = "Xinyi Zhao"
  }
}