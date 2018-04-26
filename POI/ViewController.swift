//
//  ViewController.swift
//  POI
//
//  Created by kuku_eri@yahoo.com on 4/24/18.
//  Copyright © 2018 kewser. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
var retrievename: String?

class ViewController: UIViewController {
    //reference to firebase database
    
      var references : DatabaseReference?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        var initialize = false
        // Do any additional setup after loading the view, typically from a nib.
        references = Database.database().reference()
        references?.child("Result").observe(.value, with: { (snapshot) in
            retrievename = snapshot.value as? String
            print(retrievename)
            if (retrievename != nil && initialize && retrievename != "Unable To Recognize:Take a photo again" )
            {
                print("I am inside fecth ")
                self.performSegue(withIdentifier: "NewdataFetched", sender: self)
             }
           else if (retrievename != nil && retrievename == "Unable To Recognize:Take a photo again" && initialize)
            {
              
                self.performSegue(withIdentifier: "NotMatch", sender: self)
            }
           initialize = true
        })
     
        
    }
  
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       /* let newVC: MatchViewController = segue.destination as! MatchViewController
        let passedPhrase = "We made it to the other side!"
        newVC.receivedPhrase = passedPhrase
        */
       // let careGiverImage = UIImageView
       // careGiverImage.image = #imageLiteral(resourceName: "fatman.png")
        
        
    }

}

