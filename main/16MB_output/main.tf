resource "null_resource" "check_state" {
  
}

data "local_file" "file_16mb" {
  filename = "5001s.txt"
}

output "short" {
  value = "some string"
}

output "output_16mb" {
  value = data.local_file.file_16mb.content
}