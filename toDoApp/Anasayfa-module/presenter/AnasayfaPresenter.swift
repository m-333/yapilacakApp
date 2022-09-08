//
//  AnasayfaPresenter.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import Foundation

class AnasayfaPresenter: ViewToPresenterAnasayfaProtocol{
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    
    func yapilacaklariYukle() {
        anasayfaInteractor?.tumYapilacaklariAl()
    }
    func ara(aramaKelimesi: String) {
        anasayfaInteractor?.yapilacakAra(aramaKelimesi: aramaKelimesi)
    }
    func sil(yapilacak_id: Int) {
        anasayfaInteractor?.yapilacakSil(yapilacak_id: yapilacak_id)
    }
    
}
extension AnasayfaPresenter: InteractorToPresenterAnasayfaProtocol{
    func presenteraVeriGonder(yapilacaklarListesi: Array<Yapilacaklar>) {
        anasayfaView?.vieweVeriGonder(yapilacaklarListesi: yapilacaklarListesi)
    }
}
