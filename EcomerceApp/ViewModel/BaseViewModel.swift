//
//  BaseViewModel.swift
//  EcomerceApp
//
//  Created by shehan karunarathna on 2022-02-24.
//

import Foundation
import SwiftUI

class BaseViewModel:ObservableObject{
    @Published var currentTab:Tab = .Home
    @Published var homeTab = "Sneakers"
    
    @Published var currentProduct:Product?
    @Published var showDetails:Bool =  false
}

enum Tab: String{
    case Home = "house"
    case Heart = "heart"
    case ClipBoard = "briefcase"
    case Person = "person"
    
}
