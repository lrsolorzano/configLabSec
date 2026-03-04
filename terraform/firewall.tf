resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = "your-vpc-network-name"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["YOUR_LOCAL_IP/32"]
}

resource "google_compute_firewall" "allow_rdp" {
  name    = "allow-rdp"
  network = "your-vpc-network-name"

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["YOUR_LOCAL_IP/32"]
}

resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  network = "your-vpc-network-name"

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  source_ranges = ["10.0.0.0/8"]  // Adjust to your internal IP range
}

resource "google_compute_firewall" "deny_egress" {
  name    = "deny-egress"
  network = "your-vpc-network-name"

  deny {
    protocol = "all"
  }

  direction = "EGRESS"
}