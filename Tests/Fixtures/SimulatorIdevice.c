// Link-only fixture for the simulator timer tests, which inject a mock simulation service.
// Any accidental call into the device FFI must fail the test.
#include <TargetConditionals.h>
#include <stdlib.h>
#include "idevice.h"

#if !TARGET_OS_SIMULATOR
#error This fixture may only be compiled for an Apple simulator.
#endif

void adapter_free(struct AdapterHandle *handle) {
    abort();
}

void idevice_error_free(struct IdeviceFfiError *err) {
    abort();
}

struct IdeviceFfiError *location_simulation_clear(struct LocationSimulationHandle *handle) {
    abort();
}

void location_simulation_free(struct LocationSimulationHandle *handle) {
    abort();
}

struct IdeviceFfiError *location_simulation_new(struct RemoteServerHandle *server,
                                                struct LocationSimulationHandle **handle) {
    abort();
}

struct IdeviceFfiError *location_simulation_set(struct LocationSimulationHandle *handle,
                                                double latitude,
                                                double longitude) {
    abort();
}

struct IdeviceFfiError *pairable_host_accept(const char *name,
                                             const char *model,
                                             uint16_t port,
                                             void (*pin_callback)(const char *pin, void *context),
                                             void *pin_context,
                                             PairableHostListeningCallback listening_callback,
                                             void *listening_context,
                                             PairableHostConnectedCallback connected_callback,
                                             void *connected_context,
                                             uint8_t *out_host_alt_irk,
                                             struct RpPairingFileHandle **out_pairing_file) {
    abort();
}

struct IdeviceFfiError *remote_server_connect_rsd(struct AdapterHandle *provider,
                                                  struct RsdHandshakeHandle *handshake,
                                                  struct RemoteServerHandle **handle) {
    abort();
}

void remote_server_free(struct RemoteServerHandle *handle) {
    abort();
}

void rp_pairing_file_free(struct RpPairingFileHandle *handle) {
    abort();
}

struct IdeviceFfiError *rp_pairing_file_read(const char *path, struct RpPairingFileHandle **out) {
    abort();
}

struct IdeviceFfiError *rp_pairing_file_write(struct RpPairingFileHandle *handle, const char *path) {
    abort();
}

void rsd_handshake_free(struct RsdHandshakeHandle *handle) {
    abort();
}

struct IdeviceFfiError *tunnel_create_rppairing(const idevice_sockaddr *addr,
                                                idevice_socklen_t addr_len,
                                                const char *hostname,
                                                struct RpPairingFileHandle *pairing_file,
                                                const char *(*pin_callback)(void *context),
                                                void *pin_context,
                                                struct AdapterHandle **out_adapter,
                                                struct RsdHandshakeHandle **out_handshake) {
    abort();
}
