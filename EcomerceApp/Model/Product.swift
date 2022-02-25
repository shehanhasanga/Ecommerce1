//
//  Product.swift
//  EcomerceApp
//
//  Created by shehan karunarathna on 2022-02-24.
//

import Foundation
import SwiftUI
struct Product:Identifiable{
    var id: String = UUID().uuidString
    var productImage:String
    var productTitle:String
    var productPrice:String
    var productBG:Color
    var isLiked:Bool = false
    var productRating:Int
}

var products :[Product] = [

    Product(productImage: "helmet-no1", productTitle: "Nike Air Max 20", productPrice: "$240.0", productBG: Color.blue.opacity(0.4),isLiked: true, productRating: 4),
    Product(productImage: "helmet-no2", productTitle: "Excee Sneakers", productPrice: "$260.0", productBG: Color.green.opacity(0.4), productRating: 3),
    Product(productImage: "helmet-no3", productTitle: "Air Max Motion 2", productPrice: "$240.0", productBG: Color.orange.opacity(0.4), productRating: 5),
    Product(productImage: "helmet-no4", productTitle: "Leather Sneaker", productPrice: "$240.0", productBG: Color.blue.opacity(0.1), productRating: 4)

]
