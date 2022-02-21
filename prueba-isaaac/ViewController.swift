//
//
//  Created by Jose Isaac Chin López 20 de febrero
//  Copyright © 2022 All rights reserved.
//
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    private var viewModel : RootViewModel?
    
    var ScrollView : UIScrollView?
    var topImageView: UIImageView?
    var imageBook : UIImageView?
    var bienvenidosLabel : UILabel?
    var correoTextField : UITextField?
    var contrasenaTextField : UITextField?
    var correoLabel: UILabel?
    var contrasenaLabel: UILabel?
    var loginButton : UIButton?
    var cuentaLabel : UILabel?
    var registrateButton: UIButton?
    var bienvenidoView : UIView?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var backgroundColor = UIColor(displayP3Red: 11/255, green: 14/255, blue: 11/255, alpha: 1)
    var brownColor = UIColor(displayP3Red: 43/255, green: 187/255, blue: 52/255, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.correoTextField?.delegate = self
        self.contrasenaTextField?.delegate = self
        
        viewModel = RootViewModel()
        activityIndicator?.startAnimating()
        tableView?.isHidden = true
        

        navigationItem.hidesSearchBarWhenScrolling = false
        
        viewModel = RootViewModel()
   
        tableView?.backgroundColor = .white
        
      
       
        //imagen de fondo
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "fondo")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

        //llamar función initUI
        initUI()
    }
    func initUI(){
        topImageView = UIImageView(frame: CGRect(x: 0, y: height/6 - 60, width: width, height: height/5))
        topImageView?.image = UIImage(named: "topImage")
        view.addSubview(topImageView!)
        
        bienvenidoView = UIView(frame: CGRect(x: 20, y: height/4 + 60, width: width - 40, height: 140))
        bienvenidoView?.backgroundColor = .white
        bienvenidoView?.layer.cornerRadius = 20
        view.addSubview(bienvenidoView!)
        
        imageBook = UIImageView(frame: CGRect(x: width/3, y: 0, width: 90, height: 90))
        imageBook?.image = UIImage(named: "popcorn")
        bienvenidoView?.addSubview(imageBook!)
        
        bienvenidosLabel = UILabel(frame: CGRect(x: 0, y: 80, width: width, height: 50))
        bienvenidosLabel?.text = "¡Bienvenido!"
        bienvenidosLabel?.font = .boldSystemFont(ofSize: 35)
        bienvenidosLabel?.textAlignment = .center
        bienvenidosLabel?.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        bienvenidoView?.addSubview(bienvenidosLabel!)
        
        // MARK: - formulario de log in
        
        correoTextField = UITextField(frame: CGRect(x:20, y:460, width: width - 40, height: 60))
        correoTextField?.backgroundColor = .white
        correoTextField?.layer.cornerRadius = 7
        correoTextField?.layer.borderColor = brownColor.cgColor
        correoTextField?.layer.borderWidth = 2
        correoTextField?.keyboardType = .emailAddress
        correoTextField?.placeholder = "example@mail.com   "
        correoTextField?.textAlignment = NSTextAlignment.left
        view.addSubview(correoTextField!)
        
      
        contrasenaTextField = UITextField(frame: CGRect(x:20, y:540, width: width - 40, height: 60))
        contrasenaTextField?.backgroundColor = .white
        contrasenaTextField?.layer.cornerRadius = 7
        
        contrasenaTextField?.layer.borderColor = brownColor.cgColor
        contrasenaTextField?.layer.borderWidth = 2
        contrasenaTextField?.placeholder = "*************** "
        contrasenaTextField?.isSecureTextEntry = false
        contrasenaTextField?.textAlignment = NSTextAlignment.center
        view.addSubview(contrasenaTextField!)

        correoLabel = UILabel(frame: CGRect(x: 40, y: 450, width: 90, height: 20))
        correoLabel?.text = "Correo"
        correoLabel?.backgroundColor = backgroundColor
        correoLabel?.font = .boldSystemFont(ofSize: 18)
        correoLabel?.textColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        correoLabel?.textAlignment = .center
        view.addSubview(correoLabel!)
        
        contrasenaLabel = UILabel(frame: CGRect(x: 40, y: 530, width: 120, height: 20))
        contrasenaLabel?.text = "Contraseña"
        contrasenaLabel?.backgroundColor = backgroundColor
        contrasenaLabel?.font = .boldSystemFont(ofSize: 18)
        contrasenaLabel?.textColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        contrasenaLabel?.textAlignment = .center
        view.addSubview(contrasenaLabel!)
        
        loginButton = UIButton(frame: CGRect(x: 30, y: 650 , width: width - 60 , height: 50))
        loginButton?.backgroundColor = brownColor
        loginButton?.layer.cornerRadius = 20
        loginButton?.setTitleColor(.white, for: .normal)
        loginButton?.setTitle("INICIAR SESIÓN", for: .normal)
        loginButton?.addTarget(self, action: #selector(goToMovie), for: .touchUpInside)
        
        view.addSubview(loginButton!)
        
        // MARK: - Registro
        cuentaLabel = UILabel(frame: CGRect(x: 45, y: 690, width: width - 40, height: 50))
        cuentaLabel?.text = "¿Todavía no tienes una cuenta?"
        cuentaLabel?.font = .boldSystemFont(ofSize: 15)
        cuentaLabel?.textColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        view.addSubview(cuentaLabel!)
        
        registrateButton = UIButton(frame: CGRect(x: width - 150, y: 685 , width: 100, height: 60))
        registrateButton?.setTitleColor(UIColor(displayP3Red: 193/255, green: 16/255, blue: 16/255, alpha: 1), for: .normal)
        registrateButton?.setTitle("Registrate", for: .normal)
        registrateButton?.addTarget(self, action: #selector(register), for: .touchUpInside)
        view.addSubview(registrateButton!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) }


    //alerta de campos vacios
    func alertEmpaty () {
        let alertText = ""
        let alert = UIAlertController(title: "Llene todos los campos", message: alertText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok entiendo", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func alertEmpatyEmail () {
       let alertText = ""
        let alert = UIAlertController(title: "Pon un correo valido, con @", message: alertText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok entiendo", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Función de botones
         
    //funcion log in
    @IBAction func goToMovie(_ sender: Any) {
       var correoVar = "exolivil@gmail.com"
        if (contrasenaTextField?.text?.isEmpty)! || (correoTextField?.text?.isEmpty)!  {
           alertEmpaty()
       } else {
           if let correo = correoTextField?.text {
               correoVar = String(correo)
               if isValidEmail(correoVar) == true {
                   print("Este es tu correo: \(correoVar)")
                   let gotoMovie: () = print("ir a peliculas")
                  performSegue(withIdentifier: "goMovie", sender: gotoMovie)
               }
               else {
                   alertEmpatyEmail()
               }
           }
           
           
          
          
       }
    }
    
    
    //funcion de ir al registro
    @objc func register (){
        print("go to register")
         let register = RegisterViewController()
        register.modalPresentationStyle = .fullScreen
        present(register, animated: true, completion: nil)
    }
    
    func isValidEmail(_ email: String) -> Bool
        {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
        }
}

