//
//  SecondViewController.swift
//  AccelometerTest
//
//  Created by Nova Arisma on 11/07/19.
//  Copyright © 2019 Nova Arisma. All rights reserved.
//

import UIKit
import CoreMotion

class SecondViewController: UIViewController {

    var motion = CMMotionManager()
    @IBOutlet weak var xGyroLabel: UILabel!
    @IBOutlet weak var yGyroLabel: UILabel!
    @IBOutlet weak var zGyroLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    myGyroscape()
    }
    
    func myGyroscape() {
        motion.gyroUpdateInterval = 0.1
        if motion.isGyroAvailable {
            motion.startGyroUpdates(to: .main) { (data, error) in
                if let trueData = data {
                    let x = trueData.rotationRate.x
                    let y = trueData.rotationRate.y
                    let z = trueData.rotationRate.z
                    
                    self.xGyroLabel.text = "x: \(x)"
                    self.yGyroLabel.text = "y: \(y)"
                    self.zGyroLabel.text = "z: \(z)"
                    
                    self.view.backgroundColor = UIColor.init(displayP3Red: CGFloat(x/5), green: CGFloat(y/5), blue: CGFloat(z/5), alpha: 1)
                    
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
