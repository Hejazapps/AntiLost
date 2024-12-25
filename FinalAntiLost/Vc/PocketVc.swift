import UIKit
import CoreMotion
import AVFoundation

class PocketVc: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var toggleImv: UIImageView!
   
    var isPocketModeEnabled = false
  
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Tap to Enable"
        
    }

    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true)
    }

    @IBAction func enablePocketMode(_ sender: Any) {
        toggleImv.image = isPocketModeEnabled ? UIImage(named: "tap") : UIImage(named: "disbale")
        label.text = isPocketModeEnabled ? "Tap to Enable" : "Disable"
        isPocketModeEnabled.toggle()
        
    }
    
}
