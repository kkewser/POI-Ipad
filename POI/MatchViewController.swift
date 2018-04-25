//
//  MatchViewController.swift
//  POI
//
//  Created by Katariina Martikainen on 25/04/2018.
//  Copyright © 2018 kewser. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {

    @IBOutlet weak var myLabel1: UILabel!
    var receivedPhrase = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myLabel1.text = receivedPhrase
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
