//
//  Home.swift
//  EcomerceApp
//
//  Created by shehan karunarathna on 2022-02-24.
//

import SwiftUI

struct Home: View {
    @Namespace var animation
    @EnvironmentObject var viewModel: BaseViewModel
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack{
                HStack{
                    Button{
                        
                    }label: {
                        Image(systemName: "book")
                            .font(.system(size: 25))
                    }
                    Spacer()
                    
                    Button{
                        
                    }label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 25))
                    }
                }
                .foregroundColor(.black)
                .overlay(
                    Text("Brand")
                        .font(.title2)
                        .bold()
                )
                HStack{
                    Text("Our Products")
                        .font(.title)
                        .bold()
                    Spacer()
                    Button{
                        
                    }label: {
                        HStack{
                            Text("Sort By")
                                .font(.caption.bold())
                            Image(systemName: "chevron.down")
                        }
                        .foregroundColor(.gray)
                    }
                }
                .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing:20){
                        SegmentButton(image: "qrcode", title: "Sheakers")
                        SegmentButton(image: "stopwatch", title: "Sheakers")
                        SegmentButton(image: "bag", title: "Sheakers")
                    }
                    .padding(.vertical)
                }
                
                let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
                LazyVGrid(columns: columns, spacing: 18) {
                    ForEach(products){
                        product in
                        CardView(product: product)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.currentProduct = product
                                    viewModel.showDetails = true
                                    
                                }
                              
                            }
                    }
                }
            }
            .padding()
            .padding(.bottom, 100)
        }
        .overlay(
            DetailsView(animation: animation).environmentObject(viewModel)
        )
    }
    
    @ViewBuilder
    func CardView(product:Product) -> some View{
        VStack(spacing:15){
            Button{
                
            }label: {
                Image(systemName: "heart.fill")
                    .font(.system(size: 13))
                    .foregroundColor(product.isLiked ? .white : .gray)
                    .padding(5)
                    .background(
                        Color.red.opacity(product.isLiked ? 1 : 0),
                        in: Circle()
                    )
                
            }
            .frame(maxWidth:.infinity, alignment: .trailing)
            Image(product.productImage)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .matchedGeometryEffect(id: product.productImage, in: animation)
                .padding()
                .rotationEffect(.init(degrees: -20))
                .background(
                    ZStack{
                        Circle().fill(product.productBG.opacity(0.3))
                            .padding(0)
                        Circle().stroke(product.productBG)
                            .padding(0)
                    }
                )
            Text(product.productTitle)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text(product.productPrice)
                .font(.title2.bold())
            HStack{
                ForEach(1..<6,id:\.self){
                    index in
                    Image(systemName: "star.fill")
                        .foregroundColor(product.productRating < index ? .gray.opacity(0.6) : .yellow)
                        .font(.system(size: 10))
                }
                Text("(\(product.productRating))")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.black)
            }
        }
        .padding()
        .background(Color.white, in: RoundedRectangle(cornerRadius: 20))
    }
    
    @ViewBuilder
    func SegmentButton(image:String, title:String) -> some View{
        Button{
            withAnimation {
                viewModel.homeTab = title
            }
        }label: {
            HStack(spacing:10){
                Image(systemName: image)
                    .font(.system(size: 25))
                Text(title)
                    .font(.system(size: 13))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(
                ZStack{
                    if viewModel.homeTab == title {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                }
            )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
