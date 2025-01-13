//
//  NetworkVc.swift
//  FinalAntiLost
//
//  Created by SADIQUL AMIN IBNE AZAD on 13/1/25.
//

import UIKit
import AVFoundation

class NetworkVc: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    
    var isFromNetwork = false
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var toggleImv: UIImageView!
    
    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.onDisconnected = {
            self.runAudio()
        }

        networkManager.onConnected = {
            
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.restoreScreenBrightness()
        
    }
    
    @IBAction func gotoPreviousView(_ sender: Any) {
        self.dismiss(animated: true
    )
    }
    
    func reduceScreenBrightness() {
        UIDevice.current.isBatteryMonitoringEnabled = true
        UIApplication.shared.isIdleTimerDisabled = true
        // Reduce screen brightness to a lower value (e.g., 30% of maximum brightness)
        UIScreen.main.brightness = 0.2
        networkManager.startMonitoring()
        print("reduce has been called")
    }
    
    func restoreScreenBrightness() {
        UIDevice.current.isBatteryMonitoringEnabled = false
        // Restore the original brightness level
        UIApplication.shared.isIdleTimerDisabled = false
        UIScreen.main.brightness = 1.0
        audioPlayer?.currentTime = 0
        audioPlayer?.stop()
        networkManager.stopMonitoring()
        print("reduce has been off")
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
   
    @IBAction func gotoNetwork(_ sender: Any) {
        toggleImv.image = isFromNetwork ? UIImage(named: "tap") : UIImage(named: "disbale")
        label.text = isFromNetwork ? "Tap to Enable" : "Disable"
        isFromNetwork.toggle()
        
        if isFromNetwork {
            
            self.reduceScreenBrightness()
           
        }
        else {
            self.restoreScreenBrightness()
        }
    }
    
}
