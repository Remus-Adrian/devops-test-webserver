
// creating a Vm for quake server 
resource "google_compute_instance" "vm_quake_live" {
  name         = "ubuntu-quakelive"
  machine_type = "n1-highcpu-2"
  zone         = var.zone

  tags = ["qlsrv"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
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

resource "google_compute_firewall" "ql-server-default" {
  name    = "ql-server"
  network = "default"

  allow {
    protocol = "udp"
    ports    = ["27960"]
  }

  allow {
    protocol = "tcp"
    ports    = ["27960"]
  }

  source_tags = ["qlsrv"]
}