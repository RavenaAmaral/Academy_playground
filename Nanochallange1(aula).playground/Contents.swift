//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let ImageMeet = UIImage(named: "Group 23.png")
         let MeetMyCity = UIImageView (image: ImageMeet)
        MeetMyCity.frame = CGRect(x: 0, y: 0, width: 849, height: 139)
        
        let Image2 = UIImage(named: "FotoPerfil.png")
                let FotoPerfil = UIImageView (image: Image2)
        FotoPerfil.frame = CGRect(x: 338, y: 297, width: 170, height: 158)
        
        let labelBemVinda = UILabel()
        labelBemVinda.frame = CGRect(x: 250, y: 193, width: 374 , height: 50 )
        labelBemVinda.text = "Bem vinda, Ravena"
        labelBemVinda.textColor = .black
        
       
        let labelMeusPontos = UILabel ()
        labelMeusPontos.frame = CGRect(x: 131, y: 634, width: 232, height: 31)
        labelMeusPontos.text = "Meus pontos"
        labelMeusPontos.textColor = .black
        
        let labelMeusGuias = UILabel ()
        labelMeusGuias.frame = CGRect(x: 354, y: 634, width: 165, height: 31)
        labelMeusGuias.text = "Meus guias"
        labelMeusGuias.textColor = .black
        
        let labelAvaliacoes = UILabel ()
        labelAvaliacoes.frame = CGRect(x: 565, y: 634, width: 154, height: 31)
        labelAvaliacoes.text = "Avaliações"
        labelAvaliacoes.textColor = .black
        
        let labelSolicitacoes = UILabel ()
        labelSolicitacoes.frame = CGRect(x: 233, y: 822, width: 380, height: 70)
        labelSolicitacoes.text = "Solicitações de turistas"
        labelSolicitacoes.textColor = .black
        
     //   let labelMarta = UILabel ()
     //   labelMarta.frame = CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>)
    //    labelMarta.text = "Marta"
     //   labelMarta.textColor = .black
        
        //let collectionTuristas = UICollectionView
        
        
        
        
        view.addSubview(MeetMyCity)
        self.view = view
        
        view.addSubview(labelBemVinda)
        self.view = view
        
        view.addSubview(labelMeusPontos)
        self.view = view
        
        view.addSubview(FotoPerfil)
        self.view = view
        
        view.addSubview(labelMeusGuias)
        self.view = view
        
        view.addSubview(labelAvaliacoes)
        self.view = view
        
        view.addSubview(labelSolicitacoes)
        self.view = view
        
      //  view.addSubview(labelMarta)
              // self.view = view
        
    }
}
//Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
