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

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var nowPlayingLabel: UILabel!
    var player: AVPlayer?
    var isPlaying: Bool = false
    let playImage = UIImage(named: "Oval 13 + Triangle 6")
    let pauseImage = UIImage(named: "Oval 13 + Triangle 7")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var error: NSError?
        let url =  NSURL(string: "http://dir.xiph.org/listen/1042227/listen.m3u")
        
        //getTrackInfo()
        
        
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
        player?.pause()
        isPlaying = false
        stateButton.setImage(playImage, forState: .Normal)
    }
    
    func getTrackInfo() -> Dictionary<String, String> {
        var url : String = "https://www.kimonolabs.com/api/5yo6lcpi?apikey=3b3b2eb5e50239231dcbace9f81e392a"
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
            
            if (jsonResult != nil) {
                let result: NSDictionary! = jsonResult["results"] as NSDictionary
                let collection1: NSDictionary! = result["collection1"] as NSDictionary
                println(collection1["songInfo"])
            } else {
                println(error)
            }
            
            
        })
        
        
        return ["nu": "nu"];
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

