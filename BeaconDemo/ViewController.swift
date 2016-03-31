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

    @IBOutlet weak var inRangeLabel: UILabel!
    @IBOutlet weak var proximityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        

        let foo = NSUUID(UUIDString: "E20A39F4-73F5-4BC4-A12F-17D1AD07A961")
        
        self.beaconRegion = CLBeaconRegion(proximityUUID: foo!,
            major: 0,
            minor: 0,
            identifier: "raspberrypi")
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
        print("Failed monitoring region: \(error.description)")
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Location manager failed: \(error.description)")
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {

            for beacon in beacons {
                self.proximityLabel.text = "\(beacon.proximity.rawValue)"
            }
        
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        self.inRangeLabel.text = "Left range"
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        self.inRangeLabel.text = "In range"        
    }

}

