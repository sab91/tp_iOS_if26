//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let str2 = "mamen"

//q3
var x: Int = 2

var prix: Double = 12.56

print(prix)
print("prix=",prix)

//q4
var nom:String = "Benmiled"
var prenom:String = "Sabri"

print(nom,"",prenom)

func echo1(nom: String, prenom: String) -> String {
    return "le nom est \(nom) et le prenom est \(prenom)."
}

print(echo1(nom: "John", prenom: "Doe"))

func echo2(chaine: String) -> Int {
    return chaine.utf8.count
}

print(echo2(chaine: "France"))

//q5
var sigleISI = ["NF19", "IF26", "NF20", "LO07"]

print(sigleISI[1])

var newsigleISI = [
    "IF26": "Conception mobile",
    "NF19": "Base de données",
    "NF20": "Théorie des graphes",
    "LO07": "Technologies Web",
]

print(newsigleISI["IF26"]!)

//q6
typealias Point = (Int, Int)

let point1: Point = (4,6)
let point2: Point = (10,0)


func fpoint(point3: Point, point4: Point) -> Point {
    var point: Point
    var xMax = 0
    var yMax = 0
    if point3.0 > point4.0 {
        xMax = point3.0
    }
    else {
        xMax = point4.0
    }
    
    if point3.1 > point4.1 {
        yMax = point3.1
    }
    else {
        yMax = point4.1
    }
    point = (xMax, yMax)
    return point
    
}

var res = fpoint(point3: (5,7), point4: (4,3))
print(res)

//Exercice 2

//q1


