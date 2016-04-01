//
//  ViewController.swift
//  BeaconDemo
//
//  Created by julie.yaunches on 3/31/16.
//  Copyright © 2016 julie.yaunches. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    var beaconRegion: CLBeaconRegion?
    var logger: BeaconLogger? {
        get {
            return self.loggerVC!.logger as? BeaconLogger
        }
    }
    var proximity: CLProximity = CLProximity.Unknown
    var loggerVC: BeaconLoggerVC?

    @IBOutlet weak var inRangeLabel: UILabel!
    @IBOutlet weak var proximityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        if self.childViewControllers.count > 0 {
            if let loggerVC = self.childViewControllers[0] as? BeaconLoggerVC {
                self.loggerVC = loggerVC
            }
        }        

        let foo = NSUUID(UUIDString: "E20A39F4-73F5-4BC4-A12F-17D1AD07A961")
        
        self.beaconRegion = CLBeaconRegion(proximityUUID: foo!,
            major: 0,
            minor: 0,
            identifier: "raspberrypi")

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target:self.loggerVC, action: Selector("showActionOptions"))
    }
    
    @IBAction func stop(sender: AnyObject) {
        locationManager.stopMonitoringForRegion(self.beaconRegion!)
        locationManager.stopRangingBeaconsInRegion(self.beaconRegion!)
    }

    @IBAction func start(sender: AnyObject) {
        locationManager.startMonitoringForRegion(self.beaconRegion!)
        locationManager.startRangingBeaconsInRegion(self.beaconRegion!)
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, monitoringDidFailForRegion region: CLRegion?, withError error: NSError) {
        self.logger!.logMe("Failed monitoring region: \(error.description)")
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        self.logger!.logMe("Location manager failed: \(error.description)")
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        for beacon in beacons {
            if (self.proximity != beacon.proximity) {
                self.proximity = beacon.proximity
                switch(self.proximity) {
                case CLProximity.Far:
                    self.proximityLabel.text = "Far"
                    self.logger!.logMe("Proximity change: Far")
                    break
                case CLProximity.Immediate:
                    self.proximityLabel.text = "Immediate"
                    self.logger!.logMe("Proximity change: Immediate")
                    break
                case CLProximity.Near:
                    self.proximityLabel.text = "Near"
                    self.logger!.logMe("Proximity change: Near")
                    break
                default:
                    self.proximityLabel.text = "Unknown"
                    self.logger!.logMe("Proximity change: Unknown")

                }
                self.loggerVC!.reloadData()
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        self.logger!.logMe("Have left beacon range")
        self.inRangeLabel.text = "Left range"
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        self.inRangeLabel.text = "Have entered beacon range"
    }

}

