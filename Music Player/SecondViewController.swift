//
//  SecondViewController.swift
//  Music Player
//
//  Created by Youmeiyi Pan on 3/14/17.
//  Copyright © 2017 Youmeiyi Pan. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBAction func Play(_ sender: Any) {


        if audioStuffed==true && audioPlayer.isPlaying == false {
            audioPlayer.play()
            
        } else {
            
        }
    }
    
    @IBAction func Pause(_ sender: Any) {
        if audioStuffed==true && audioPlayer.isPlaying{
            audioPlayer.pause()
            
        } else {
            
        }
    }
    
    @IBAction func Restart(_ sender: Any) {
        if audioStuffed==true {
            
                audioPlayer.currentTime = 0
                audioPlayer.play()
                    }
    }
    
    @IBAction func prev(_ sender: Any) {
        if audioStuffed==true && thisSong != 0 {
            playThis(thisOne:songs[thisSong - 1])
            thisSong -= 1
            label.text = songs[thisSong]
            
        } else {
            
        }
    }
    
    @IBAction func next(_ sender: Any) {
//        if thisSong == songs.count - 1{
//            thisSong = 0
//        } else {
//            thisSong += 1
//        }
        if audioStuffed==true && thisSong < songs.count - 1 {
            
            playThis(thisOne:songs[thisSong + 1])
            
            thisSong += 1
            label.text = songs[thisSong]
            
        } else {
        
           
        }
        
    }
    @IBAction func slider(_ sender: UISlider) {
        
        if audioStuffed==true {
            audioPlayer.volume = sender.value
        }
    }
    
    func playThis(thisOne:String) {
        do{
            //by checking which row user tapped on
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            
            // put the content we want into the audioplayer
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            
//            if thisSong == songs.count - 1{
//                 thisSong = 0
//            } else {
//                thisSong += 1
//            }
            
         } catch{
            print("Error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = songs[thisSong]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

