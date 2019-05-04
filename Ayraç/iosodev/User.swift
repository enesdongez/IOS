//
//  File.swift
//  iosodev
//
//  Created by Enes Dongez on 2.05.2019.
//  Copyright © 2019 Enes. All rights reserved.
//

class UserModel{
    
    var id: String?
    var adsoyad: String?
    var kullaniciadi: String?
    var mail:String?
    var sifre:String?
    
    init(id:String?,adsoyad:String?,kadi:String?,mail:String?,sifre:String?){
        self.adsoyad=adsoyad
        self.id=id
        self.kullaniciadi=kadi
        self.mail=mail
        self.sifre=sifre
    }
}
