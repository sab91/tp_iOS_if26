//: Playground - noun: a place where people can play

import UIKit




class Cursus {
    
    var profil: [Module]
    
    func ajoute(m: Module) {
        profil.append(m)
    }
    
    init() {
        profil = []
        ajoute(m: Module(sigle: "LO07", categorie: "TM", credit: 6, resultat: .A))
        ajoute(m: Module(sigle: "IF26", categorie: "TM", credit: 6, resultat: .B))
        ajoute(m: Module(sigle: "NF19", categorie: "TM", credit: 6, resultat: .C))
        ajoute(m: Module(sigle: "NF16", categorie: "CS", credit: 6, resultat: .A))
        ajoute(m: Module(sigle: "ST09", categorie: "ST", credit: 30, resultat: .B))
        ajoute(m: Module(sigle: "IF10", categorie: "CS", credit: 6, resultat: .D))
        ajoute(m: Module(sigle: "ST10", categorie: "ST", credit: 30, resultat: .C))
    }
    
    func getSigles() -> [String] {
        var res: [String] = []
        for module in profil {
            res.append(module.sigle)
        }
        
        return res
    }
    
    // A faire par les étudiants
    func getResumes() -> [String] {
        let res: [String] = []
    // ...
        return res
    }
    
    func getModules(position: Int) -> Module {
        let module: Module = profil[position]
        return module
    }
    
    func count() -> Int {
        return profil.count
    }
    
}




//==================================== Module =======================================


class Module {
    
    var sigle: String
    var categorie: String
    var credit: Int
    var resultat: Resultat
    
    init() {
        self.sigle = "?"
        self.categorie = "?"
        self.credit = 6
        self.resultat = .A
    }
    
    init(sigle: String, categorie: String, credit: Int, resultat: Resultat) {
        self.sigle = sigle
        self.categorie = categorie
        self.credit = credit
        self.resultat = resultat
    }
    
    public var descriptor: String {
        return "Module(\(sigle),\(categorie),\(credit),\(resultat))"
    }
    
//    func getSigle() -> String {return sigle}
//
//    func setSigle(sigle: String) {
//        self.sigle = sigle
//    }
//
//    func getCategorie() -> String {
//        return categorie
//    }
//
//    func setCategorie(categorie: String) {
//        self.categorie = categorie
//    }
//
//
//    func getCredit() -> Int {
//        return credit
//    }
//
//    func setCredit(credit: Int) {
//        self.credit = credit
//    }
//
//    func getResultat() -> Resultat {
//        return resultat
//    }
//
//    func setResultat(resultat: Resultat) {
//        self.resultat = resultat
//    }
//
//    func toString() -> String {
//        return "Module{sigle= \(getSigle()), categorie= \(getCategorie()), credit= \(getCredit()), resultat= \(getResultat())}"
//    }
//
//   func affiche() {
//        print(toString())
//    }
}



//============================== ModuleTriCrédit=========================


//class ModuleTriCredit : Comparator<Module> {
//
//    func compare(m1: Module,m2: Module) -> Int {
//        if m1.getCredit() > m2.getCredit() {
//            return 1
//        } else if m1.getCredit() < m2.getCredit() {
//            return -1
//        } else {
//            return 0
//        }
//
//    }
//}


//=====================================  ModuleTriRésultat ============================


//class ModuleTriResultat : Comparator<Module> {
//
//    func sortedArray(m1: Module, m2: Module) -> Int {
//        if m1.getResultat().getNote().rawValue > m2.getResultat().getNote() {
//            return 1
//        } else if m1.getResultat().getNote().rawValue < m2.getResultat().getNote() {
//            return -1
//        } else {
//            return 0
//        }
//
//    }
//}


// ========================== Résulat ==============================

enum Resultat: Int {
    
    case A = 18
    case B = 16
    case C = 14
    case D = 12
    case E = 10
    case FX = -2
    case F = -5
    case ABS,R = 0
}

var monCursus = Cursus()
var m1 = Module(sigle: "IF34", categorie: "TM", credit: 6, resultat: .A)
monCursus.ajoute(m1)
print(monCursus.getSigles())
