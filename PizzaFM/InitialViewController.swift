//
//  InitialViewController.swift
//  PizzaFM
//
//  Created by Andrew Breckenridge on 10/10/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation


class InitialViewController: UIViewController {
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var nowPlayingLabel: UILabel!
    
    //Add song string code
    
    var player: AVPlayer?
    var isPlaying: Bool = true
    let url =  NSURL(string: "http://128.174.91.29:8009/pizzaFM")
    
    let playImage = UIImage(named: "Oval 13 + Triangle 6")
    let pauseImage = UIImage(named: "Oval 13 + Triangle 7")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = AVPlayer(URL: url)
        player?.play()
        print(player)
        
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.pizzafm.org/time.html")!))
    }

    func play() {
        player?.play()
        isPlaying = true
        stateButton.setImage(pauseImage, forState: .Normal)
    }
    
    func pause() {
        player?.pause()
        isPlaying = false
        stateButton.setImage(playImage, forState: .Normal)
    }
    
    @IBAction func stateButtonHit(sender: AnyObject) {
        if isPlaying {
            pause()
        } else {
            play()
        }
    }
    
    @IBAction func facebookButtonHit(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://www.facebook.com/pizzafm")!)
    }
    @IBAction func twitterButtonHit(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://twitter.com/pizzaradio")!)
    }
    @IBAction func webButtonHit(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://pizzafm.org")!)
    }
}

