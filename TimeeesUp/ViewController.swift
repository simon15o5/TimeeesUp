//
//  ViewController.swift
//  TimeeesUp
//
//  Created by Simon Alam on 19.04.21.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    var timer: Timer?
    @IBOutlet var timeField: UIDatePicker!
    
    @IBOutlet var timerProgress: UIView!
   
    @IBOutlet var timeLabel: UILabel!
    var player: AVAudioPlayer!
    var minutes: Double = 0.0
    var seconds: Double! = 0.0
    var totalSeconds = 0
    override func viewDidLoad() {
        
        super.viewDidLoad()
      
        timeLabel.text = ""
        
        
      
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.currentTitle == "Start Timer" {
            // start the timer
            let time = timeField.countDownDuration
            print(time)
            totalSeconds = Int(time)
           
            timer = Timer.scheduledTimer(timeInterval: 1 , target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
            timeLabel.isHidden = false
            timeField.isHidden = true
            sender.setTitle("Stop Timer", for: .normal)
        } else if sender.currentTitle == "Stop Timer" {
            timeField.isHidden = false
                        // Stop the timer
                        timeLabel.isHidden = true
                        timer?.invalidate()
                        sender.setTitle("Start Timer", for: .normal)
        }

    }
    
    
    @objc func timerFired() -> Void {
        
        // Decrement the counter of the counter
       totalSeconds -= 1
        
        // update the label
        let hours = totalSeconds / 60
        let minutes = totalSeconds % 60
        timeLabel.text = "\(hours):\(minutes)"
        
        // Stop the timer if it reaches zeri
        if totalSeconds == 0 {
            timeLabel.textColor = UIColor.red
            timeLabel.text = "Over!!!"
            playSound()
            
            
            timer?.invalidate()
            print("Times up")
         
  
            
        }
       
    }
    func playSound() {
        print("No")
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}

