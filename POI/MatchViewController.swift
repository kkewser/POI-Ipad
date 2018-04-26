//
//  MatchViewController.swift
//  POI
//
//  Created by Katariina Martikainen on 25/04/2018.
//  Copyright © 2018 kewser. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import AVFoundation

class MatchViewController: UIViewController {
    var ref: DatabaseReference?
    var player: AVAudioPlayer?
    
    @IBOutlet weak var myLabel1: UILabel!
    var receivedPhrase = String()
    
    @IBOutlet weak var ImageOfCaregiver: UIImageView!
    
    @IBOutlet weak var FirstnameCaregiver: UILabel!
    
    @IBOutlet weak var LastNameCaregiver: UILabel!
    var vurl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //myLabel1.text = receivedPhrase
        myLabel1.text=retrievename
        // reference to database
        ref = Database.database().reference()
        let reference:DatabaseReference =  (ref?.child(retrievename!))!
      // Fetch the data under the retrievename
        reference.observe(.childAdded, with: { (snapshot) in
            // keys in Database
            let firstname="FirstName"
            let lastname="LastName"
            let image="image"
           
            // Fetch the image using image key
            if (( image.elementsEqual(snapshot.key)) == true)
            {
                let urlImage : String?
                urlImage = snapshot.value as?  String
                if let urls = URL(string: urlImage!)
                {
                    do {
                            let data = try Data(contentsOf: urls)
                            self.ImageOfCaregiver.image = UIImage(data: data)
                        }
                    catch let err
                        {
                            print(" Error : \(err.localizedDescription)")
                        }
                }
            }
            // Fetch the first name from database
            else if ((firstname.elementsEqual(snapshot.key)) == true)
            {
                let retFirstname: String?
                retFirstname = snapshot.value as? String
                self.FirstnameCaregiver.text = retFirstname
            }
            // Fetch the lastname from database
            else if ((lastname.elementsEqual(snapshot.key)) == true)
            {
                let retSecondname: String?
                retSecondname = snapshot.value as? String
                self.LastNameCaregiver.text = retSecondname
            }
            // Fetch the audio url from database
            else {
                    self.vurl = snapshot.value as? String
                    if (self.vurl?.contains(".m4a"))!
                    {
                        do
                        {
                            let fileURL: NSURL = NSURL(string: self.vurl!)!
                            let soundData = NSData(contentsOf: fileURL as URL)
                            self.player = try AVAudioPlayer(data: soundData! as Data)
                        }
                        catch
                        {
                            print("Player is not assigned")
                        }
                    }
                // play the th audio
                    self.player?.play()
                  }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}










/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */











/*  if let urls = URL(string: self.vurl!){
 
 do {
 //let data = try Data(contentsOf: urls)
 
 self.player = try AVAudioPlayer(contentsOf: urls)
 print("Assign the Audio")
 }catch let err {
 print(" Error : \(err.localizedDescription)")
 }
 
 print("after Assign the Audio")
 }*/
//dispatchgroup.leave()
/* do{
 
 try self.player = AVAudioPlayer(contentsOf: url as! URL)
 }
 catch{
 
 }*/
/*var seprate = self.vurl?.components(separatedBy: "/")
 var seprate2=seprate![(seprate?.count)!-1]
 let beforepath=seprate2.components(separatedBy: "?")
 print("beforePath")
 print(beforepath)
 var  pathsbefore=beforepath[0]
 var paths = pathsbefore.replacingOccurrences(of: ".m4a" , with: "")
 // let paths=paths2.replacingOccurrences(of: "%20", with: " ")
 
 */
//print(seprate![(seprate?.count)!-1])
// let paths = seprate![(seprate?.count)!-1]
//let paths=Bundle.main.path(forResource: "Kewser", ofType: "m4a")
  // let url = NSURL(string: pathsbefore)
