//
//  OverChargeVc.swift
//  FinalAntiLost
//
//  Created by SADIQUL AMIN IBNE AZAD on 25/12/24.
//

import UIKit

class OverChargeVc: UIViewController {
    var isOverCharged = false
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var toggleImv: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Tap to Enable"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func dimissView(_ sender: Any) {
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
    @IBAction func doCharge(_ sender: Any) {
        
        toggleImv.image = isOverCharged ? UIImage(named: "tap") : UIImage(named: "disbale")
        label.text = isOverCharged ? "Tap to Enable" : "Disable"
        isOverCharged.toggle()
        
    }
    
}
