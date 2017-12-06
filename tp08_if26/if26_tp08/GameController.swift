//
//  GameController.swift
//  if26_tp08
//
//  Created by Sabri on 21/11/2017.
//  Copyright © 2017 Sabri. All rights reserved.
//

import UIKit
class GameController: UIViewController {
    
    var nombreHasard: Int = 0
    var compteur: Int = 0
    var rejouer: Bool = false
    
    @IBOutlet weak var valider: UIButton!
    @IBOutlet weak var champsText: UITextField!
    @IBOutlet weak var resultat: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valider.isEnabled = false
        champsText.keyboardType = UIKeyboardType.numberPad
        choisirNombreAuHasard()
    }
    
    func choisirNombreAuHasard() {
        self.nombreHasard = Int(arc4random_uniform(100)) + 1
        
    }
    
    @IBAction func entrerNombre(_ sender: UITextField) {
        if self.champsText.text!.characters.count != 0 {
            valider.isEnabled = true
        }
        else {
            valider.isEnabled = false
        }
    }
    
    
    @IBAction func testerNombre(_ sender: UIButton) {
        if rejouer == false {
            valider.isEnabled = false
            let nombre: Int = Int(champsText.text!)!
            
            if nombre < 1 && nombre > 100 {
                print("Le nombre n'est pas compris entre 1 et 100")
            }
            else if nombre < nombreHasard {
                print("Le nombre est plus grand que ", nombre)
                compteur = compteur + 1
            }
            else if nombre > nombreHasard {
                
            }
        }
    }
    
}


