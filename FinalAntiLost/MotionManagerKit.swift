import CoreMotion
import AudioToolbox

class MotionManagerKit {
    private let motionManager = CMMotionManager()
    var isMonitoring = false
    var motionThresholds: (x: Double, y: Double, z: Double) = (0.3, 0.3, 0.7)  // Thresholds for motion detection
    
    var onMotionDetected: (() -> Void)?  // Callback for motion detection
    
    // Start monitoring accelerometer
    func startMonitoring() {
        guard !isMonitoring else { return }
        
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1  // Set accelerometer update interval (0.1 seconds)
            
            // Start receiving accelerometer data
            motionManager.startAccelerometerUpdates(to: .main) { [weak self] data, error in
                guard let self = self, let data = data else { return }
                
                let x = data.acceleration.x
                let y = data.acceleration.y
                let z = data.acceleration.z
                
                print("got value \(abs(x)) \(abs(y)) \(abs(z))")
                
                // Check if motion exceeds thresholds
                if abs(x) > self.motionThresholds.x && abs(y) > self.motionThresholds.y && abs(z) > self.motionThresholds.z {
                    // Trigger the motion detected action
                    self.onMotionDetected?()
                    
                    // Print motion data to console
                    print("Motion detected! X: \(x), Y: \(y), Z: \(z)")
                    
                    // Trigger vibration on motion detection
                    AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                }
            }
            isMonitoring = true
        } else {
            print("Accelerometer not available on this device.")
        }
    }
    
    // Stop monitoring accelerometer
    func stopMonitoring() {
        guard isMonitoring else { return }
        
        motionManager.stopAccelerometerUpdates()
        isMonitoring = false
    }
}
