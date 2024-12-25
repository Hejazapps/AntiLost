//
//  Antitheft.swift
//  Antilost
//
//  Created by SADIQUL AMIN IBNE AZAD on 11/12/24.
//

import UIKit

class Antitheft: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func gotoPocket(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PocketVc") as!  PocketVc
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func gotoAlarmView(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AlarmVc") as!  AlarmVc
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func gotoChargeView(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OverChargeVc") as!  OverChargeVc
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
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
