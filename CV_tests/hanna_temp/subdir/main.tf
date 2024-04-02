resource "random_pet" "subdir_referenced" {
  count = 2
  keepers = {
    time = timestamp()
    custom = var.custom_var
  }
}

locals {
  map =  {
    some_long_string = 10
    even_much_longer_string = 20
    the_string_as_hard_as_a_day_and_as_long_as_the_whole_week_without_beer = 30
  }
}

resource "random_password" "test" {
  for_each = local.map
  length = each.value
}

variable "custom_var" {
  
}

#output "pet_name" {
  #description = "The `id` of the `random_pet.referenced` resource in this module."
  #value       = random_pet.subdir_referenced.id
#}

resource "random_integer" "int" {
  min = 0
  max = 255
}


