//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import Foundation

let navigation = UINavigationController(screenType: .ipadPro10_5, isPortrait: false)

class CollectionCell: UICollectionViewCell {
    
    public var imageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 145))
    public var labelNomeTurista: UILabel = UILabel(frame: CGRect(x:45, y: 150, width: 60,height: 20))

    public override init(frame: CGRect){
        super.init(frame:frame)
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        self.addSubview(imageView)
        labelNomeTurista.font = UIFont(name: "OpenSans-Regular", size: 18)
        labelNomeTurista.textAlignment = NSTextAlignment.center
        labelNomeTurista.textColor = .black
        self.addSubview(labelNomeTurista)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.textoCelula.text = "oi"
//        self.contentView.addSubview(textoCelula)
//        self.textoCelula.textColor = .white
//        self.textoCelula.textAlignment = .left

//}

class MyViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    //var selecionarTurista: UICollectionView??
    //func collectionView(_ coleectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //return CGSize(width: 450, height: 300)
    //}
    var collectionView: UICollectionView?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print(turistas.count)
        return turistas.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.row)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionCell
        cell.labelNomeTurista.text = turistas[indexPath.section].name
        //cell.backgroundColor = .white
        cell.imageView.image = turistas[indexPath.section].foto
        
        // cell.imageView.image = UIImage(named: turistas[indexPath.section].foto)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        secondViewController.modalPresentationStyle = .fullScreen
        //: IMPORTANTE: aqui estamos "passando um dado" de um view controller para o outro
        secondViewController.turista = turistas[indexPath.section]
        present(secondViewController, animated: true, completion: nil)
        
    }
    
    var turistas: [Turista] = []
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let fontURL = Bundle.main.url(forResource: "OpenSans-Regular", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(fontURL, CTFontManagerScope.process, nil)
        
        let marta = Turista(name: "Marta", idade: "22", cidade: "São Paulo", linguasFaladas: "português, espanhol", historia: "Olá, eu sou Marta, estudo história e amo conhecer os cantos tradicionais da cidade, pra entender um pouco mais sobre a sua cultura. Além de ir para áreas históricas, adoro sair de noite para beber e dançar. Amo pop, funk e samba e curto bastante um karaoke. Em relação a comida, curto de tudo, mas quando viajo gosto de provar a culinária local. Bom, no geral gosto de locais animados e que eu possa conhecer gente nova.", foto: "Marta.jpg")
        
        let jorge = Turista(name: "Jorge", idade: "26", cidade: "Mendoza, Argentina", linguasFaladas: "espanhol", historia: "Sou o Jorge, um veterinário que adora a natureza. Quando viajo gosto de conhecer as belezas naturais da cidade e de locias em volta. Sou daqueles que adora uma aventura. O ponto alto de uma viagem para mim é a comida, mas como amo todos os seres vivos, só como comida vegana!", foto: "Jorge.jpg")
        
        let chloe = Turista(name: "Chloe", idade: "24", cidade: "Chicago, Estados Unidos", linguasFaladas: "inglês", historia: "Olá, acho que o guia ideal para mim deve ser aquele que me leve para locais bem animados, onde eu possa conhecer outros jovens. Adoro tudo que é moderno e atual. Sendo assim, não curto museus e passeios históricos, acho eles entediantes. Em relação á comida sou um pouco chata. Só gosto de massas e frituras", foto: "chloe.jpg")
        
        let verena = Turista(name: "Verena", idade: "27", cidade: "Rivera, Uruguai", linguasFaladas: "espanhol, italiano", historia: "Tudo bom? Então, sou deficiente física e por esse motivo preciso que meu guia seja repleto de locais acessíveis, mas que também tenham a ver comigo. Sou um pouco introvertida e amo conhecer a história do local. Além disso, sou apaixonada por arte nas suas mais variadas formas. Quando viajo gosto de conhecer a cidade o máximo possível, então dou preferência a locais que tragam a história da sua cidade. Isso em relação a restaurantes também", foto: "verena.jpg")
        
        let pedro = Turista(name: "Pedro", idade: "20", cidade: "Petrolina, Brasil", linguasFaladas: "português, francês", historia: "Olá, eu sou o Pedro! eu adoro rolês baratos e que tenham muita música e bebida. No meu guia não pode faltar as boates lgbt e locais frequentados por pessoas lgbt. Adoro ir a locais históricos também, mas como passarei apenas 3 dias prefiro priorizar a curtição. Como irei conhecer muitas cidades do Nordeste, preciso gastar pouco, por isso queria indicações de locais pra comer que sejam gostosos, bem servidos e baratos", foto: "pedro.jpg")
        
        turistas.append(marta)
        turistas.append(jorge)
        turistas.append(chloe)
        turistas.append(verena)
        turistas.append(pedro)
        
        
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        
        layout.sectionInset = UIEdgeInsets(top: 32, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 195, height: 190)
        
        collectionView = UICollectionView(frame: CGRect(x: 126, y: 891, width: 581, height: 191), collectionViewLayout: layout)
        //  collectionView.frame = CGRect(x: 239, y: 770, width: 380, height: 70)
        // This line must appear before setting the data source.
        collectionView?.register(CollectionCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView?.backgroundColor = .white
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        // var imagemcelula: UIImage = collectionView.b
        //imagemcelula = marta.foto
        
        
        
        let ImageMeet = UIImage(named: "Group 23.png")
        
        let MeetMyCity = UIImageView (image: ImageMeet)
        MeetMyCity.frame = CGRect(x: 0, y: 0, width: 849, height: 139)
        let Image2 = UIImage(named: "FotoPerfil.png")
        
        let FotoPerfil = UIImageView (image: Image2)
        FotoPerfil.frame = CGRect(x: 338, y: 297, width: 170, height: 158)
        
        let labelBemVinda = UILabel()
        labelBemVinda.frame = CGRect(x: 230, y: 197, width: 374 , height: 50 )
        labelBemVinda.text = "Bem vinda, Ravena"
        labelBemVinda.font = UIFont(name: "OpenSans-Regular", size: 35)
        labelBemVinda.textColor = .black
        
        let labelMeusPontos = UILabel()
        labelMeusPontos.frame = CGRect(x: 131, y: 634, width: 232, height: 31)
        labelMeusPontos.text = "Meus pontos"
        labelMeusPontos.font = UIFont(name: "OpenSans-Regular", size: 28)
        labelMeusPontos.textColor = .black
        
        let labelMeusGuias = UILabel()
        labelMeusGuias.frame = CGRect(x: 354, y: 634, width: 165, height: 31)
        labelMeusGuias.text = "Meus guias"
        labelMeusGuias.font = UIFont.systemFont(ofSize: 28)
        labelMeusGuias.textColor = .black
        labelMeusGuias.font = UIFont(name: "OpenSans-Regular", size: 28)
        
        let labelAvaliacoes = UILabel()
        labelAvaliacoes.frame = CGRect(x: 565, y: 634, width: 154, height: 31)
        labelAvaliacoes.text = "Avaliações"
        labelAvaliacoes.font = UIFont.systemFont(ofSize: 28)
        labelAvaliacoes.textColor = .black
        labelAvaliacoes.font = UIFont(name: "OpenSans-Regular", size: 28)
        
        let labelSolicitacoes = UILabel()
        labelSolicitacoes.frame = CGRect(x: 239, y: 770, width: 380, height: 70)
        labelSolicitacoes.text = "Solicitações de turistas"
        labelSolicitacoes.font = UIFont.systemFont(ofSize: 35)
        labelSolicitacoes.textColor = .black
        labelSolicitacoes.font = UIFont(name: "OpenSans-Regular", size: 35)
        
        let buttonPontos = UIButton()
        buttonPontos.frame = CGRect(x: 149, y: 518, width: 119, height: 108)
        buttonPontos.setImage(UIImage(named: "Pontos.png"), for: .normal)
        
        let buttonGuias = UIButton()
        buttonGuias.frame = CGRect(x: 363, y: 518, width: 119, height: 108)
        buttonGuias.setImage(UIImage(named: "Meus guias.png"), for: .normal)
        let buttonAvaliacoes = UIButton()
        
        buttonAvaliacoes.frame = CGRect(x: 565, y: 518, width: 119, height: 108)
        buttonAvaliacoes.setImage(UIImage(named: "Avaliacoes.png"), for: .normal)
        // let buttonMarta = UIButton()
        // buttonMarta.frame = CGRect(x: 320, y: 859, width: 162, height: 152)
        // buttonMarta.setImage(UIImage(named: "Turista Marta.png"), for: .normal)
        //buttonMarta.addTarget(self, action: "buttonTapped", for: UIControl.Event .touchUpInside)
        // onde tem "buttonTapped eu posso chamar a função dps- da classe turistas
        //let collectionTuristas = UICollectionView
        view.addSubview(buttonGuias)
        view.addSubview(buttonPontos)
        view.addSubview(buttonAvaliacoes)
        view.addSubview(MeetMyCity)
        view.addSubview(labelBemVinda)
        view.addSubview(labelMeusPontos)
        view.addSubview(FotoPerfil)
        view.addSubview(labelMeusGuias)
        view.addSubview(labelAvaliacoes)
        view.addSubview(labelSolicitacoes)
        view.addSubview(collectionView!)
        self.view = view
        // view.addSubview(labelMarta)
        // self.view = view
    }
    // override func viewDidLoad() {
    //  buttonMarta.addTarget(self, action: "buttonTapped", for: UIControl.Event .touchUpInside)
    //  buttonAvaliacoes.addTarget(self, action: "buttonTapped", for: UIControl.Event .touchUpInside)
    //  buttonGuias.addTarget(self, action:"buttonTapped", for: UIControl.Event .touchUpInside)
    // }
}
let myViewController = MyViewController(screenType: .ipadPro10_5, isPortrait: true)
//Present the view controller in the Live View window
PlaygroundPage.current.liveView = navigation.scale(to: 0.4)
navigation.pushViewController (myViewController, animated: false)
navigation.navigationBar.isHidden = false

