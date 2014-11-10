//
//  ViewController.swift
//  PizzaFM
//
//  Created by Andrew Breckenridge on 10/10/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    let player: MPMoviePlayerViewController = MPMoviePlayerViewController(contentURL: NSURL(string: "http://dir.xiph.org/listen/1042227/listen.m3u"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        player.moviePlayer.movieSourceType = .Streaming
        self.presentViewController(player, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func play() {
        player.moviePlayer.play()
    }
    
    func pause() {
        player.moviePlayer.pause()
    }

    @IBAction func hitPlayButton(sender: AnyObject) {
        pause()
    }

}

