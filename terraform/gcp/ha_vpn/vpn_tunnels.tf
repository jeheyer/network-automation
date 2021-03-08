# Create VPN Tunnels
resource "google_compute_vpn_tunnel" "VPN_TUN_0" {
  name                            = "${var.region}-${var.peer_gateway_name}-tun-0"
  vpn_gateway                     = var.vpn_gateway_name
  peer_external_gateway           = var.peer_gateway_name
  depends_on                      = [ google_compute_external_vpn_gateway.EXTERNAL_VPN_GATEWAY ]
  shared_secret                   = var.tun_0_psk
  router                          = var.cloud_router_name
  peer_external_gateway_interface = 0
  vpn_gateway_interface           = 0
  region                          = var.region
  provider                        = google-beta
}
resource "google_compute_vpn_tunnel" "VPN_TUN_1" {
  name                            = "${var.region}-${var.peer_gateway_name}-tun-1"
  vpn_gateway                     = var.vpn_gateway_name
  peer_external_gateway           = var.peer_gateway_name
  depends_on                      = [ google_compute_external_vpn_gateway.EXTERNAL_VPN_GATEWAY ]
  shared_secret                   = var.tun_1_psk
  router                          = var.cloud_router_name
  peer_external_gateway_interface = 1
  vpn_gateway_interface           = 1
  region                          = var.region
  provider                        = google-beta
}
