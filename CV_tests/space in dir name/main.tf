resource "random_pet" "pet" {
  
}

output "pet_name" {
  value = "Pet created: ${random_pet.pet.id}"
}