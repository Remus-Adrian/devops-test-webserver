
// creating a cloud resource 
resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "f1-micro"
  zone         = var.zone

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  



  
}