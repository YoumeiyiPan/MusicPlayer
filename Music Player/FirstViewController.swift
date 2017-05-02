//
//  FirstViewController.swift
//  Music Player
//
//  Created by Youmeiyi Pan on 3/14/17.
//  Copyright © 2017 Youmeiyi Pan. All rights reserved.
//

import UIKit
import AVFoundation

var songs:[String] = []
var audioPlayer = AVAudioPlayer()
var thisSong = 0
var audioStuffed = false

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
  
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = songs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do{
            //by checking which row user tapped on
            let audioPath = Bundle.main.path(forResource: songs[indexPath.row], ofType: ".mp3")
            
            // put the content we want into the audioplayer
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            thisSong = indexPath.row  // which song is currently playing
            audioStuffed = true
        } catch{
            print("Error")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gettingSongName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gettingSongName() {
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        // loop through the folder
        do {
            // get the name of songs, all files stored in songPath
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for song in songPath {
                var mySong = song.absoluteString
                if mySong.contains(".mp3") {
                    //print (mySong)
                   
                    let findString = mySong.components(separatedBy: "/")  //get the name we want
                    mySong = (findString[findString.count-1])  // file name contains %20
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "") // remove .mp3 extension
                    songs.append(mySong)
                }
            }
             myTableView.reloadData()
        } catch {
            
        }
    }


}

