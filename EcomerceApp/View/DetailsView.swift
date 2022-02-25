//
//  DetailsView.swift
//  EcomerceApp
//
//  Created by shehan karunarathna on 2022-02-24.
//

import SwiftUI

struct DetailsView: View {
    @EnvironmentObject var viewModel: BaseViewModel
    var animation: Namespace.ID
    @State var size = "US 6"
    @State var shoeColor = Color.red
    var body: some View {
        if let product = viewModel.currentProduct, viewModel.showDetails{
            VStack(spacing:0){
                HStack{
                    Button{
                        withAnimation {
                            viewModel.showDetails = false
                        }
                       
                    }label: {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                    Spacer()
                    
                    Button{
                        
                    }label: {
                        Image(systemName: "suit.heart.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.red,  in: Circle())
                    }
                }
                .foregroundColor(.black)
                .overlay(
                    Text("Brand")
                        .font(.title2)
                        .bold()
                )
                .padding(.horizontal)
                .padding(.bottom)
                
                Image(product.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: product.productImage, in: animation)
                    .frame(width: 220, height: 220)
                    .rotationEffect(.init(degrees: -20))
                    .background(
                        ZStack{
                            Circle().fill(product.productBG)
                                .padding()
                            Circle().stroke(product.productBG)
                                .padding()
                        }
                    )
                    .frame(height:getBounds().height / 3)
                
                VStack(alignment:.leading, spacing: 12){
                    HStack{
                        Text(product.productTitle)
                            .font(.title.bold())
                        Spacer()
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(product.productRating)")
                            .foregroundColor(.gray)
                    }
                    Text("we could use a lot of suplimative to describe the Nike Air Max 2021. We could tell u that we have incoparated recycled materials.")
                        .font(.callout)
                        .lineSpacing(10)
                    HStack(spacing:0){
                        Text("Size:")
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                            .padding(.trailing)
                        ForEach(["US 6","US 7","US 8","US 9"], id:\.self){
                            sizestr in
                            Button{
                                withAnimation {
                                    size = sizestr
                                }
                               
                            }label:{
                                Text(sizestr)
                                    .font(.callout)
                                    .foregroundColor(.black)
                                    .padding(.vertical,8)
                                    .padding(.horizontal)
                                    .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.blue)
                                        .opacity(self.size == sizestr ? 0.3 : 0)
                                    )
                            }
                        }
                    }
                    .padding(.vertical)
                    
                    HStack(spacing:15){
                        let colors : [Color] = [.yellow, .red,.purple, .green]
                        Text("Color:")
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                            .padding(.trailing)
                        ForEach(colors, id:\.self){
                            colornew in
                            Button{
                                withAnimation {
                                    shoeColor = colornew
                                }
                               
                            }label:{
                                Circle().fill(colornew.opacity(0.4))
                                    .frame(width: 25, height: 25)
                                    .overlay(
                                        Circle().stroke(Color.blue.opacity(0.5), lineWidth: 5)
                                            .opacity(shoeColor == colornew ? 1 : 0)
                                            .padding(-4)
                                    )
                                
                            }
                        }
                    }
                    .padding(.vertical)
                    
                    Button{
                        
                    }label: {
                        HStack{
                            Image(systemName: "cart")
                                .font(.system(size: 20))
                            
                            Text("Add to cart ")
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(maxWidth:.infinity)
                        .background(Color.blue.opacity(0.5))
                        .clipShape(Capsule())
                      
                    }
                    .padding(.top)
                   
                }
                .padding(.top)
                .padding()
                .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
                .background(
                    Color.blue.opacity(0.5)
                        .cornerRadius(20)
                        .ignoresSafeArea(.container, edges: .bottom)
                
                )
            }
            .padding(.vertical)
            .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.white)
            .ignoresSafeArea(.container,edges: .bottom)
        }
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func getBounds() -> CGRect{
        return UIScreen.main.bounds
    }
}
