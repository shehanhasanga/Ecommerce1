//
//  BaseView.swift
//  EcomerceApp
//
//  Created by shehan karunarathna on 2022-02-24.
//

import SwiftUI

struct BaseView: View {
    @StateObject var viewModel = BaseViewModel()
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection: $viewModel.currentTab){
            Home()
                .environmentObject(viewModel)
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.1))
                .tag(Tab.Home)
            Text("Heart")
                .tag(Tab.Heart)
            Text("Clipboard")
                .tag(Tab.ClipBoard)
            Text("Person")
                .tag(Tab.Person)
        }
        .overlay(
            HStack{
                TabButton(tab: .Home)
                TabButton(tab: .Heart)
                Button{
                    
                }label: {
                    Image(systemName: "cart")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .padding(18)
                        .offset(x:-1)
                        .background(.blue)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                }
                .offset(y: -32)
                TabButton(tab: .ClipBoard)
                TabButton(tab: .Person)
            }
                .background(
                    Color.white
                        .clipShape(CustomCurveShape())
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                        .ignoresSafeArea(.container, edges: .bottom)
                           )
                .ignoresSafeArea(.container, edges: .bottom)
                .offset(y: viewModel.showDetails ? 200 : 0)
               
//                .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
            
            , alignment: .bottom
        )
    }
    @ViewBuilder
    func TabButton(tab:Tab) -> some View{
        Button{
            withAnimation {
                viewModel.currentTab = tab
            }
        }label: {
            Image(systemName: tab.rawValue)
                .font(.system(size: 25))
                .foregroundColor(viewModel.currentTab == tab ? .blue : .gray)
                .frame(maxWidth:.infinity)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
