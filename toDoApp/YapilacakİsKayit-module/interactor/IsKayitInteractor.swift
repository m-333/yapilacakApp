//
//  IsKayitInteractor.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import Foundation
class IsKayitInteractor : PresenterToInteractorIsKayitPortocol {
    let db:FMDatabase?
    
    init (){
   let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
   let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func yapilacakEkle(yapilacak_is: String) {
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO yapilacaklar (yapilacak_is) VALUES (?)", values: [yapilacak_is])
        } catch{
            print(error.localizedDescription)
            print("hata var")
        }
        db?.close()
    }
}
