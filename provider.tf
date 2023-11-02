terraform {

  required_version = ">= 0.12.0"
  
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}


terraform {
  backend "azurerm" {
    resource_group_name   = var.TF_Pipeline_RG[count.index] //"RG-PRD-QC-SAP"
    storage_account_name  = var.TF_Pipeline_Stroage_AC_Name[count.index] //"stqcsapprddaa02test"
    container_name        = var.TF_Pipeline_Container_name[count.index] //"adostgpipeline"
    key                   = "terraform.tfstate"
  }
}
