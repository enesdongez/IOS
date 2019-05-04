//
//  kitaplik.swift
//  kitaplık
//
//  Created by Enes Dongez on 14.03.2019.
//  Copyright © 2019 Enes Dongez. All rights reserved.
//
import Firebase

class kitaplik {

  
    func kullanicigiris(kullaniciadi:String,sifre:String)->Bool{
        if(kullaniciadi != "" && sifre != ""){
            return true
        }
        else{
            return false
        }
    }

}
