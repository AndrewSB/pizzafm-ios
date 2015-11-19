//
//  AppDelegate.swift
//  PizzaFM
//
//  Created by Andrew Breckenridge on 10/10/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
import AVFoundation

import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Fabric.with([Crashlytics()])

        var setCategoryError: NSError?
        do { try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback) }        
        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: true)
        
        return true
    }
}

