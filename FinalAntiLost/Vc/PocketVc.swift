//
//  PocketVc.swift
//  FinalAntiLost
//
//  Created by SADIQUL AMIN IBNE AZAD on 24/12/24.
//

import UIKit

class PocketVc: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var toggleImv: UIImageView!
    var isEnabled = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

    @IBAction func enablePocketMode(_ sender: Any) {
        
        toggleImv.image = isEnabled ? UIImage(named: "tap") : UIImage(named: "disbale")
        label.text = !isEnabled ? "Disable" : "Enable"
        
        isEnabled.toggle()
        
        
        
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
