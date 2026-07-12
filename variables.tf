variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  sensitive   = true
}

variable "label_prefix" {
  description = "Prefix used for Azure resources"
  type        = string
  default     = "zhao0201"
}

variable "location" {
  description = "Azure region used for the AKS cluster"
  type        = string
  default     = "canadacentral"
}

variable "node_vm_size" {
  description = "Virtual machine size for the AKS node pool"
  type        = string
  default     = "Standard_B2s"
}