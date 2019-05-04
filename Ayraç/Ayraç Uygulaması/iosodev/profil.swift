//
//  profil.swift
//  iosodev
//
//  Created by Enes Dongez on 26.04.2019.
//  Copyright © 2019 Enes. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class profil: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableviewprofil: UITableView!
    
      var profilkitaplistesi=[profilkitaplist]()
      @IBOutlet weak var adsoyad: UILabel!
 
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profilkitaplistesi.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellT = tableView.dequeueReusableCell(withIdentifier: "cellprofil",for:indexPath)as! profilbar
        let kitabimiz:profilkitaplist
        
        kitabimiz = profilkitaplistesi[indexPath.row]
       
        cellT.labelkitapad.text=kitabimiz.kitapad
        cellT.labelyazar.text=kitabimiz.kitapyazar
        
        
        
        return cellT
    }
    
    
    @IBOutlet weak var mailim: UILabel!
    var adsoyadim:String?
    var ref:DatabaseReference!
    var ref2:DatabaseReference!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        ref = Database.database().reference().child("kullanicilar")
        ref.observe(.value, with: {(snapshot) in

            for users in snapshot.children.allObjects as![DataSnapshot]{
                
                let obje=users.value as?[String: AnyObject]
                let ad=obje?["ad"]
                let kullaniciid=obje?["id"]
                let kullaniciadi=obje?["kullaniciadi"]
                let mail=obje?["mail"]
                let sifre=obje?["sifre"]
                
                let user=UserModel(id: kullaniciid as! String, adsoyad: ad as! String, kadi: kullaniciadi as! String, mail: mail as! String, sifre: sifre as! String)
                
                if user.mail==self.adsoyadim{
                   self.mailim.text=user.mail
                   self.adsoyad.text=user.adsoyad
                    
                    
                    
                }
                
            }
        })
        
        ref2 = Database.database().reference().child("profilkitap")
        ref2.observe(.value, with: {(snapshot) in
            if snapshot.childrenCount>0{
                self.profilkitaplistesi.removeAll()
                
                //print(snapshot.value as Any)
                
                for kitaplarimiz in snapshot.children.allObjects as![DataSnapshot]{
                    
                    let kitapobjem=kitaplarimiz.value as?[String: AnyObject]
                    let id=kitapobjem?["id"]
                    let kitapid=kitapobjem?["kitapid"]
                    let kullanici=kitapobjem?["kullanicimail"]
                    let kitapad=kitapobjem?["kitapad"]
                    let kitapyazar=kitapobjem?["kitapyazar"]
                    
                    let kitap=profilkitaplist(idim: id as! String, kitapidim: kitapid as! String, kitapadim: kitapad as! String, kitapyazar: kitapyazar as! String, kullanici: kullanici as! String)
                    
                    if kitap.kullanici == self.adsoyadim{
                        
                        self.profilkitaplistesi.append(kitap)
                  
                        
                    }
                    
                    
                }
                self.tableviewprofil.reloadData()
            }
            
            })
      
        
    }
    
    @IBOutlet weak var labeld: UILabel!
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
   

}
