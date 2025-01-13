//
//  UnPlagVc.swift
//  FinalAntiLost
//
//  Created by SADIQUL AMIN IBNE AZAD on 13/1/25.
//

import UIKit

class UnPlagVc: UIViewController {

    var isPocketModeEnabled = false
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var toggleImv: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func enablePocketMode(_ sender: Any) {
        toggleImv.image = isPocketModeEnabled ? UIImage(named: "tap") : UIImage(named: "disbale")
        label.text = isPocketModeEnabled ? "Tap to Enable" : "Disable"
        isPocketModeEnabled.toggle()
        
    }

    @IBAction func gotoPreviousView(_ sender: Any) {
        self.dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
