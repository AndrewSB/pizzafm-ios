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
    
    let player: MPMoviePlayerController = MPMoviePlayerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func play() {
        player.contentURL = NSURL(fileURLWithPath: "http://dir.xiph.org/listen/1042227/listen.m3u")
        player.movieSourceType = .Streaming
        player.prepareToPlay()
        self.view.addSubview(player.view)
        player.play()
    }

}

