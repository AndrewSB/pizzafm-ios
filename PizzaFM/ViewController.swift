//
//  ViewController.swift
//  PizzaFM
//
//  Created by Andrew Breckenridge on 10/10/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

class ViewController: UIViewController {
    //let player: MPMoviePlayerViewController = MPMoviePlayerViewController(contentURL: NSURL(string: "http://dir.xiph.org/listen/1042227/listen.m3u"))
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var error: NSError?
        let url =  NSURL(string: "http://dir.xiph.org/listen/1042227/listen.m3u")
        

        player = AVPlayer(URL: url)
        player?.play()
        println("say lol")
        println(player?.currentItem.description)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func play() {
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }

    @IBAction func hitPlayButton(sender: AnyObject) {
        pause()
    }

}

