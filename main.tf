terraform {
  required_version = ">= 1.3.9"
}

variable "subject" {
   type = string
   default = "World"
   description = "Subject to hello"
}

resource "random_id" "id" {
  keepers = {
    trigger = var.subject
  }

  byte_length = 4
}

output "hello_world" {
  value = "Hello World, ${var.subject} ${random_id.id.hex}!"
}


resource "time_sleep" "wait_300_seconds" {
  create_duration = "300s"
}
