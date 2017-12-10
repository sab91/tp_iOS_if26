//
//  GameController.swift
//  Le Juste Nombre
//
//  Téléchargé depuis http://semrom.fr/download/info/swift/22/GameControllerComplete.zip
//  Copyright © 2017 Romain Semler. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    
    var nombreHasard: Int = 0
    var compteur: Int = 0
    var rejouer: Bool = false
    
    @IBOutlet weak var resultat: UILabel!
    @IBOutlet weak var champNombre: UITextField!
    @IBOutlet weak var boutonValider: UIButton!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        boutonValider.isEnabled = false
        champNombre.keyboardType = UIKeyboardType.numberPad
        choisirNombreAuHasard()
    }
    
    
    
    func choisirNombreAuHasard() {
        
        self.nombreHasard = Int(arc4random_uniform(1000)) + 1
    }
    
    
    
    @IBAction func enterNumber(_ sender: UITextField) {
        if champNombre.text!.count != 0 {
            boutonValider.isEnabled = true
        } else {
            boutonValider.isEnabled = false
        }
    }
    
    var borneinf: Int = 1
    var bornesup: Int = 1000
    
    @IBAction func testerNombre(sender: UIButton) {
        
        if !self.rejouer {
            
            boutonValider.isEnabled = false
            
            let nombre: Int = Int(champNombre.text!)!
            
            if nombre < 1 || nombre > 1000 {
                
                resultat.text = "Merci d'entrer un nombre entre 1 et 1000."
                
            } else if nombre < nombreHasard {
                
                borneinf = nombre
                resultat.text = "Le nombre est plus grand que \(nombre).\n Le nombre est compris entre \(borneinf) et \(bornesup)"
                compteur += 1
                
            } else if nombre > nombreHasard {
                
                bornesup = nombre
                resultat.text = "Le nombre est plus petit que \(nombre).\n Le nombre est compris entre \(borneinf) et \(bornesup)"
                compteur += 1
                
            } else {
                
                compteur += 1
                champNombre.isUserInteractionEnabled = false
                resultat.text = "Bravo !\nVous avez trouvé le nombre \(nombreHasard).\n\nNombre d'essais : \(compteur)."
                boutonValider.setTitle("Rejouer", for: UIControlState())
                boutonValider.isEnabled = true
                self.rejouer = true
                
            }
            
            champNombre.text = ""
            
        } else {
            
            self.rejouer = false
            resultat.text = ""
            champNombre.isUserInteractionEnabled = true
            boutonValider.setTitle("Valider", for: UIControlState())
            boutonValider.isEnabled = false
            borneinf = 1
            bornesup = 1000
            self.compteur = 0
            choisirNombreAuHasard()
        }
        
    }
    
}

