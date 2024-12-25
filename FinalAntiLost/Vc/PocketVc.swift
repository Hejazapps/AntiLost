import UIKit
import CoreMotion
import AVFoundation

class PocketVc: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var toggleImv: UIImageView!
    
    var isPocketModeEnabled = false
    
    private var motionManagerKit: MotionManagerKit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Tap to Enable"
        
        motionManagerKit = MotionManagerKit()
        
        // Set up the callback for motion detection
        motionManagerKit?.onMotionDetected = {
            // You can add additional functionality here when motion is detected
            print("Significant motion detected!")
        }
        
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func enablePocketMode(_ sender: Any) {
        toggleImv.image = isPocketModeEnabled ? UIImage(named: "tap") : UIImage(named: "disbale")
        label.text = isPocketModeEnabled ? "Tap to Enable" : "Disable"
        isPocketModeEnabled.toggle()
        
        if isPocketModeEnabled {
            motionManagerKit?.startMonitoring()
        } else {
            motionManagerKit?.stopMonitoring()
        }
        
        
    }
    
}
