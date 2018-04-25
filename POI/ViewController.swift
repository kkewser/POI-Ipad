//
//  ViewController.swift
//  POI
//
//  Created by kuku_eri@yahoo.com on 4/24/18.
//  Copyright © 2018 kewser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newVC: MatchViewController = segue.destination as! MatchViewController
        let passedPhrase = "We made it to the other side!"
        newVC.receivedPhrase = passedPhrase
        
       // let careGiverImage = UIImageView
       // careGiverImage.image = #imageLiteral(resourceName: "fatman.png")
        
        
    }

}

