import UIKit
import PlaygroundSupport
import Foundation

public class SecondViewController: UIViewController {
    public let secondViewController = SecondViewController(screenType: .ipadPro10_5, isPortrait: true)
    var turista: Turista?
       private var imageView: UIImageView?
       private var labelNome: UILabel?
       private var labelIdade: UILabel?
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let ImageMeet = UIImage(named: "Group 23.png")
        let MeetMyCity = UIImageView (image: ImageMeet)
        MeetMyCity.frame = CGRect(x: 0, y: 0, width: 849, height: 139)
        
        view.addSubview(MeetMyCity)
        
        imageView = UIImageView(frame: CGRect(x:36, y:100, width:300, height: 300));
        imageView?.contentMode = .scaleAspectFit
        view.addSubview(imageView!)
        
        labelNome = UILabel(frame: CGRect(x: 40, y: 350, width:300, height: 30))
        labelNome?.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(labelNome!)
        
        labelIdade = UILabel(frame: CGRect(x: 40, y: 375, width:300, height: 30))
        labelIdade?.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(labelIdade!)
        
        self.view = view

//: [Next](@next)

}
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //let imagem = UIImage(self.turista!.foto)
        //self.imageView?.image = imagem;
        self.labelNome?.text = "Nome: \(self.turista!.name)"
        self.labelIdade?.text = "Idade: \(self.turista!.idade) anos"
        //print("Carregando foto \(self.turista!.foto)")
    }
    
    @objc func voltar() {
        dismiss(animated: false, completion: nil)
    }
}
