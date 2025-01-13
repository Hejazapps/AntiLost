//
//  OverChargeVc.swift
//  FinalAntiLost
//
//  Created by SADIQUL AMIN IBNE AZAD on 25/12/24.
//

import UIKit
import AVFAudio

class OverChargeVc: UIViewController {
    var audioPlayer: AVAudioPlayer?
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.restoreScreenBrightness()
        
    }
    
    func runAudio(){
        
        guard let audioUrl = Bundle.main.url(forResource: selectedFileName, withExtension: "mp3") else {
            print("Audio file \(selectedFileName) not found.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
            audioPlayer?.prepareToPlay()
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch let error {
            print("Error loading or playing the audio file: \(error.localizedDescription)")
        }
    }
    
    @objc func batteryStateDidChange(notification: Notification) {
          switch UIDevice.current.batteryState {
          case .unknown:
              print("Battery state is unknown.")
          case .unplugged:
              print("Battery state is unknown.")
          case .charging:
              print("Charging cable is connected and charging.")
          case .full:
              self.runAudio()
          @unknown default:
              print("Unknown battery state.")
          }
      }
    
    
    func reduceScreenBrightness() {
        UIDevice.current.isBatteryMonitoringEnabled = true
        UIApplication.shared.isIdleTimerDisabled = true
        // Reduce screen brightness to a lower value (e.g., 30% of maximum brightness)
        UIScreen.main.brightness = 0.2
        print("reduce has been called")
    }
    
    func restoreScreenBrightness() {
        UIDevice.current.isBatteryMonitoringEnabled = false
        // Restore the original brightness level
        UIApplication.shared.isIdleTimerDisabled = false
        UIScreen.main.brightness = 1.0
        audioPlayer?.currentTime = 0
        audioPlayer?.stop()
        print("reduce has been off")
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
        
        if isOverCharged {
            
            self.reduceScreenBrightness()
           
        }
        else {
            self.restoreScreenBrightness()
        }
        
    }
    
}
