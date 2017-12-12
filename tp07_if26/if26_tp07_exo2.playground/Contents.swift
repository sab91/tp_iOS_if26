//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Personne {
    var nom: String
    var prenom: String
    var age: Int


    init() {
        self.nom = "Doe"
        self.prenom = "John"
        self.age = 20
    }
    
    init(nom: String, prenom: String, age: Int) {
        self.nom = nom
        self.prenom = prenom
        self.age = age
    }
    
    /*func isAdult() -> Bool {
        var adult: Bool = false
        if age > 18 {
            adult == true
        }
        return adult
    }*/
    
    func description() -> String {
        return "La personne s'apelle \(nom) \(prenom), elle a \(age) ans."
    }
    
    
}

//q7
let p1 = Personne(nom: "Ben", prenom: "Sabri", age: 21)
//p1.isAdult()
p1.description()


class Etudiant : Personne {
    var nocarte: String
    
    override init() {
        self.nocarte = "4"
        super.init()
    }
    
    init(nom: String, prenom: String, age: Int, nocarte: String) {
        self.nocarte = nocarte
        super.init(nom: nom, prenom: prenom, age: age)
    }
    
    override func description() -> String {
        return "\(nom) \(prenom) à \(age) ans et à la carte n°\(nocarte)."
    }
}

let p2 = Etudiant(nom: "Stain", prenom: "Zlatan", age: 43, nocarte: "6")
p2.description()


protocol Utt {
    func juryResultat() -> String
    func GPA() -> Int

}


class Doctorant : Etudiant, Utt {
    func juryResultat() -> String {
        print("mms")
        return "mms"
    }
    
    func GPA() -> Int {
        return 1
    }
}

let p3 = Doctorant()

p3.juryResultat()



