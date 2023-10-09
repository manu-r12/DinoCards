//
//  HomeScreenViewController.swift
//  Dino Card
//
//  Created by Manu on 2023-08-17.
//

import UIKit
import AVFoundation

class HomeScreenViewController: UIViewController {
    
    var audioPlayer1 : AVAudioPlayer!
    var audioPlayer2 : AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let musicURL1 = Bundle.main.url(forResource: "theme", withExtension: "mp3") {
            do {
                audioPlayer1 = try AVAudioPlayer(contentsOf: musicURL1)
            } catch {
                print("Error initializing audio player: \(error.localizedDescription)")
            }
        }
        if let musicURL2 = Bundle.main.url(forResource: "song", withExtension: "mp3") {
            do {
                audioPlayer2 = try AVAudioPlayer(contentsOf: musicURL2)
            } catch {
                print("Error initializing audio player: \(error.localizedDescription)")
            }
        }
        
        audioPlayer1.prepareToPlay()

        audioPlayer2.prepareToPlay()
    }
    

    @IBAction func btnPress(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToArView", sender: self)
        audioPlayer1.stop()
        audioPlayer2.stop()
        
    }
    
    

    
   
        
    @IBAction func play1Btn(_ sender: UIButton) {
        audioPlayer1.play()
        
        
    }
    @IBAction func play2Btn(_ sender: UIButton) {
        audioPlayer2.play()
    }
    
    @IBAction func stopBtn(_ sender: UIButton) {
        audioPlayer1.stop()
        audioPlayer2.stop()
    }
    
}
