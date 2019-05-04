//
//  ViewController.swift
//  iosodev
//
//  Created by Enes on 21.04.2019.
//  Copyright © 2019 Enes. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

   
    @IBOutlet weak var kontrol: UILabel!
    @IBOutlet weak var sifre: UITextField!
    @IBOutlet weak var kullaniciad: UITextField!
    var kullaniciadtut:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.hidesBackButton=true
    }

  
    @IBAction func giris(_ sender: Any) {
      /*  if kitaplik.init().kullanicigiris(kullaniciadi: kullaniciad.text!, sifre: sifre.text!){
            //performSegue(withIdentifier: "profil", sender: self)
            performSegue(withIdentifier: "anasayfagecis", sender: nil)
            
            kontrol.text="başarılı"
        }
        else{
            kontrol.text="başarısız"
        }*/
       
        
        Auth.auth().signIn(withEmail: kullaniciad.text!, password: sifre.text!) { (user,error)in
            if let error=error{
            print(error)
            return
            }
            self.kullaniciadtut=self.kullaniciad.text
            self.performSegue(withIdentifier: "anasayfagecis", sender: nil)
            
            print("giriş başarılı")
        
            
        }
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // let gnavig = segue.destination as! navigation
        if segue.identifier=="anasayfagecis"{
            let gnavig = segue.destination as! navigation
            let geciciviewcon1 = gnavig.viewControllers.first as! DenemeViewController
            geciciviewcon1.kullanicitut=kullaniciadtut
    
        }
    
    
    
            //geciciviewcon1.labelanasayfa.text=self.kullaniciad.text!
    
    

    }
   
    @IBAction func kayitol(_ sender: Any) {
         performSegue(withIdentifier: "kayitol", sender: nil)
    }
}

