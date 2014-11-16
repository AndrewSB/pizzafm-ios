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

    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var error: NSError?
        let url =  NSURL(string: "http://dir.xiph.org/listen/1042227/listen.m3u")
        
        getTrackInfo()
        
        
        player = AVPlayer(URL: url)
        player?.play()
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
    
    func getTrackInfo() -> Dictionary<String, String> {
        Alamofire.request(.GET, "https://www.kimonolabs.com/api/5yo6lcpi?apikey=3b3b2eb5e50239231dcbace9f81e392a")
            .response { (data) in
                let jsonData = SwiftyJSON.JSON(data as NSData)
                if let songName = json[0]["user"]["name"].string {
                    
                }
        }
        
        return ["nu": "nu"];
    }

    @IBAction func hitPlayButton(sender: AnyObject) {
        pause()
    }

}

