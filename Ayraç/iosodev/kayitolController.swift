//
//  kayitolController.swift
//  iosodev
//
//  Created by Enes Dongez on 24.04.2019.
//  Copyright © 2019 Enes. All rights reserved.
//

import UIKit
import Firebase

class kayitolController: UIViewController {

    var ref:DatabaseReference!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var adsoyad: UITextField!
    @IBOutlet weak var kullaniciadi: UITextField!
    @IBOutlet weak var sifrem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref=Database.database().reference().child("kullanicilar")
        //ref=Database.database().reference().child("kitaplar")
        // Do any additional setup after loading the view.
    }
    
 
    @IBAction func kayit(_ sender: Any) {
      Auth.auth().createUser(withEmail: mail.text!, password: sifrem.text!){(user,error)in
            if let error=error{
                print(error)
                return
            }
            self.performSegue(withIdentifier: "giris", sender: nil)
            print("üye oldunuz")
            
            self.adduser()
        }
 
        //adduser2()
        
    }
    func adduser2(){
        let key = ref.childByAutoId().key
        
        let user = [
            "kitapid":key,
            "kitapad":adsoyad.text! as String,
            "kitapsayfa":kullaniciadi.text! as String,
            "kitapyazar":mail.text! as String,
            "kitapozet":sifrem.text! as String
        ]
        ref.child(key).setValue(user)
    }
    
    func adduser(){
        let key = ref.childByAutoId().key
        
        let user = [
            "id":key,
            "ad":adsoyad.text! as String,
            "kullaniciadi":kullaniciadi.text! as String,
            "mail":mail.text! as String,
            "sifre":sifrem.text! as String
        ]
        ref.child(key).setValue(user)
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
