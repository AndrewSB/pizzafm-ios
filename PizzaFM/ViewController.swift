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
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var nowPlayingLabel: UILabel!
    @IBOutlet weak var navItem: UINavigationItem!
    var player: AVPlayer?
    var isPlaying: Bool = true
    let playImage = UIImage(named: "Oval 13 + Triangle 6")
    let pauseImage = UIImage(named: "Oval 13 + Triangle 7")
    let url =  NSURL(string: "http://dir.xiph.org/listen/1042227/listen.m3u")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navItem.titleView = UIImageView(image: UIImage(named: "Oval 1 + Triangle 1"))
        
        getTrackInfo()
        var getTrackInfoTimer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: Selector("getTrackInfo"), userInfo: nil, repeats: true)

        player = AVPlayer(URL: url)
        player?.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func play() {
        player?.play()
        isPlaying = true
        stateButton.setImage(pauseImage, forState: .Normal)
    }
    
    func pause() {
        player = nil
        player = AVPlayer(URL: url)
        isPlaying = false
        stateButton.setImage(playImage, forState: .Normal)
    }
    
    func getTrackInfo() -> Void {
        var url : String = "https://www.kimonolabs.com/api/5yo6lcpi?apikey=3b3b2eb5e50239231dcbace9f81e392a"
        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "GET"
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {data, urlResponse, error in
            var jsonErrorOptional: NSError?
            let jsonOptional: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &jsonErrorOptional)
            
            if let json = jsonOptional as? Dictionary<String, AnyObject> {
                if let results = json["results"] as AnyObject! as? Dictionary<String, AnyObject> {
                    if let collection1: AnyObject = results["collection1"] as AnyObject! {
                        if let songInfo = collection1[0]["songInfo"] as? String {
                            let songArray = songInfo.componentsSeparatedByString(" - ")
                            println(songArray)
                            self.nowPlayingLabel.text = String(songArray[0] + " : " + songArray[1])
                        }
                    }
                }
            }
        }
        task.resume()
        return
    }

    @IBAction func stateButtonHit(sender: AnyObject) {
        if isPlaying {
            pause()
        } else {
            play()
        }
    }
    @IBAction func facebookButtonHit(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://sheu.ru")!)
    }
    @IBAction func twitterButtonHit(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://sheu.ru")!)
    }
    @IBAction func webButtonHit(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://pizzafm.org")!)
    }
    
}

