terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

resource "time_static" "time_update" {
}

output "time_static_output" {
  value = time_static.time_update.id
}

# interpolation of the time_static resource
resource "local_file" "time" {
  filename = "/root/time.txt"
  content = "Time stamp of this file is ${time_static.time_update.id}"
}