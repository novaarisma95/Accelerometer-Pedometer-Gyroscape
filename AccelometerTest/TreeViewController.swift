//
//  TreeViewController.swift
//  AccelometerTest
//
//  Created by Nova Arisma on 11/07/19.
//  Copyright © 2019 Nova Arisma. All rights reserved.
//

import UIKit
import CoreMotion // masukan core motion

class TreeViewController: UIViewController {
    //connectkan dulu tabel tabel
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    
    //pake CMPedometer
    private let pedometer = CMPedometer()
    private let activityManager = CMMotionActivityManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startUpdating()
    }
    func startActivity(){
        activityManager.startActivityUpdates(to: .main){
            (activity) in
            
            guard let activity = activity else {return}
            
            DispatchQueue.main.async{
                if activity.walking{
                    self.typeLabel.text = "Walking"
                }
            }
        }
    }
    
    func startCounting() {
        pedometer.startUpdates(from: Date()){ (data, error) in
            guard let data = data, error == nil else {return}
            DispatchQueue.main.async {
                self.counterLabel.text = data.numberOfSteps.stringValue
            }
        }
    }
    
    func startUpdating() {
        if CMMotionActivityManager.isActivityAvailable(){
            startActivity()
        }
        if CMPedometer.isStepCountingAvailable() {
            startCounting()
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
