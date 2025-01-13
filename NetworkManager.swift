import Foundation
import Network

class NetworkManager {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitorQueue")
    
    // A closure that will be called when the network is disconnected
    var onDisconnected: (() -> Void)?
    
    // A closure that will be called when the network is reconnected
    var onConnected: (() -> Void)?
    
    // Flag to check if monitoring is started
    private var isMonitoring = false
    
    init() {
        // Set up the pathUpdateHandler to monitor network status
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                // If the network is connected (satisfied), check if it's Wi-Fi or cellular
                if path.isExpensive {
                    // Cellular network
                    print("Connected via Cellular")
                    self.onConnected?() // Trigger connection callback
                } else {
                    // Wi-Fi network
                    print("Connected via Wi-Fi")
                    self.onConnected?() // Trigger connection callback
                }
            } else {
                // If the network is not available (disconnected), trigger disconnection callback
                self.onDisconnected?()
                print("No internet connection")
            }
        }
    }
    
    // Method to start monitoring
    func startMonitoring() {
        guard !isMonitoring else {
            print("Already monitoring network.")
            return
        }
        
        monitor.start(queue: queue)
        isMonitoring = true
        print("Network monitoring started.")
    }
    
    // Method to stop monitoring
    func stopMonitoring() {
        guard isMonitoring else {
            print("Network monitoring is not started.")
            return
        }
        
        monitor.cancel()
        isMonitoring = false
        print("Network monitoring stopped.")
    }
}
