//
//  ViewController.swift
//  AccelometerTest
//
//  Created by Nova Arisma on 11/07/19.
//  Copyright © 2019 Nova Arisma. All rights reserved.
//

//accelerometer
import UIKit
import CoreMotion //tambahin dulu coremotion

class ViewController: UIViewController {
//dari main story board masukin label
    @IBOutlet weak var xAccelLabel: UILabel!
    @IBOutlet weak var yAccelLabel: UILabel!
    @IBOutlet weak var zAccelLabel: UILabel!
    //ini yang akan di panggil motion
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myAccelerometer()
    }

    func myAccelerometer() {
        motion.accelerometerUpdateInterval = 0.1
        if motion.isAccelerometerAvailable {
            motion.startAccelerometerUpdates (to: .main) { (data, error) in
                if let trueData = data {
                    let x = trueData.acceleration.x
                    let y = trueData.acceleration.y
                    let z = trueData.acceleration.z
                    
                    self.xAccelLabel.text = "x: \(x)"
                    self.yAccelLabel.text = "y: \(y)"
                    self.zAccelLabel.text = "z: \(z)"
                    
                    self.view.backgroundColor = UIColor.init(displayP3Red: CGFloat (x), green:
                        CGFloat(y), blue: CGFloat(z), alpha: 1)
                }
            }
        }
    }
    
}

