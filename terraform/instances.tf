provider "google" {
  credentials = file("path_to_your_credentials.json")
  project     = "your_project_id"
  region      = "us-central1"
}

resource "google_compute_address" "kali_ip" {
  name = "kali-static-ip"
}

resource "google_compute_instance" "kali" {
  name         = "kali-linux"
  machine_type = "e2-standard-2"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/kali-linux"
    }
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.kali_ip.address
    }
  }
}

resource "google_compute_address" "ubuntu_ip" {
  name = "ubuntu-static-ip"
}

resource "google_compute_instance" "ubuntu" {
  name         = "ubuntu-server"
  machine_type = "e2-standard-2"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.ubuntu_ip.address
    }
  }
}

resource "google_compute_address" "windows_ip" {
  name = "windows-static-ip"
}

resource "google_compute_instance" "windows" {
  name         = "windows-server"
  machine_type = "e2-standard-4"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-server-2022-dc"
    }
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.windows_ip.address
    }
  }
}