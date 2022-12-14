//
//  AnasayfaInteractor.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import Foundation
class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol{
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
   
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    func tumYapilacaklariAl(){
        var liste = [Yapilacaklar]()
        db?.open()
        do {
            let q = try db!.executeQuery("SELECT * FROM yapilacaklar", values:  nil)
            while q.next(){
                let yapilacak = Yapilacaklar(yapilacak_id: Int(q.string(forColumn: "yapilacak_id"))!,
                                             yapilacak_is:q.string(forColumn: "yapilacak_is")!)
                liste.append(yapilacak)
            }
            anasayfaPresenter?.presenteraVeriGonder(yapilacaklarListesi: liste)
        }
        catch{
            print( error.localizedDescription)
        }
        db?.close()
    }
func yapilacakAra(aramaKelimesi: String) {
    var liste = [Yapilacaklar]()
    db?.open()
    
    do{
    let q = try db!.executeQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%\(aramaKelimesi)%'", values: nil)
        
        while q.next(){
            let yapilacak = Yapilacaklar(yapilacak_id: Int(q.string(forColumn: "yapilacak_id"))!,
                                         yapilacak_is: q.string(forColumn: "yapilacak_is")!)
            liste.append(yapilacak)
        }
        
        anasayfaPresenter?.presenteraVeriGonder(yapilacaklarListesi: liste)
    }catch{
        print(error.localizedDescription)
    }
    
    db?.close()
}
func yapilacakSil(yapilacak_id: Int) {
    db?.open()
    do{
        try db!.executeUpdate("DELETE FROM yapilacaklar WHERE yapilacak_id = ? ", values: [yapilacak_id])
        tumYapilacaklariAl()
    } catch{
        print(error.localizedDescription)
    }
    db?.close()
}

}
 
