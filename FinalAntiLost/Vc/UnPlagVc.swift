//
//  UnPlagVc.swift
//  FinalAntiLost
//
//  Created by SADIQUL AMIN IBNE AZAD on 13/1/25.
//

import UIKit
import AVFoundation

class UnPlagVc: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    
    var isUnPlugged = false
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var toggleImv: UIImageView!
    var defaultBrightness = UIScreen.main.brightness
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NotificationCenter.default.addObserver(self,
                                                       selector: #selector(batteryStateDidChange),
                                                       name: UIDevice.batteryStateDidChangeNotification,
                                                       object: nil)
        
        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.restoreScreenBrightness()
        
    }
    
    
    @objc func batteryStateDidChange(notification: Notification) {
          switch UIDevice.current.batteryState {
          case .unknown:
              print("Battery state is unknown.")
          case .unplugged:
              self.runAudio()
          case .charging:
              print("Charging cable is connected and charging.")
          case .full:
              print("Battery is fully charged.")
          @unknown default:
              print("Unknown battery state.")
          }
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
    
    @IBAction func enablePocketMode(_ sender: Any) {
        toggleImv.image = isUnPlugged ? UIImage(named: "tap") : UIImage(named: "disbale")
        label.text = isUnPlugged ? "Tap to Enable" : "Disable"
        isUnPlugged.toggle()
        
        if isUnPlugged {
            
            self.reduceScreenBrightness()
           
        }
        else {
            self.restoreScreenBrightness()
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
