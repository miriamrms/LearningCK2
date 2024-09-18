//
//  AddProductView.swift
//  LearningCloudKit2
//
//  Created by Miriam Mendes on 04/09/24.
//

import SwiftUI
import CloudKit

struct AddProductView: View {
    @EnvironmentObject var viewModel: ProductViewModel
    @StateObject var model = CKModel()
    @State var showTentList: Bool = false
    @State private var nomeProduto: String = ""
    @State private var description: String = ""
    @State private var price: String = ""
    @State private var category: String = ""
    @State private var categoryImage: String = ""
    @State private var serving: String = ""
    

    var body: some View {
        VStack(spacing: 0){
            VStack{
                Button {
                    showTentList.toggle()
                } label: {
                    Text(viewModel.selectedTent?.name ?? "Selecione a Barraca")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .animation(.none, value: viewModel.selectedTent?.name ?? "Selecione a Barraca")
                        .overlay(alignment: .leading) {
                            Image(systemName: "arrow.down")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .padding()
                                .rotationEffect(Angle(degrees: showTentList ? 180 : 0))
                        }
                }

                if showTentList{
                    TentListView(showTentList: $showTentList)
                }
            }
            .background(.thickMaterial)
            .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 15)
        }.padding()
        if let selectedTent = viewModel.selectedTent {
            formAddProduct(tent: selectedTent)
        }
        
       

    }
    
}



#Preview {
    AddProductView()
        .environmentObject(ProductViewModel())
}

extension AddProductView{
    private func formAddProduct(tent: Tents) -> some View{
        VStack(alignment: .leading){
            Text("Cadastrar Produtos na \(tent.name)")
            TextField("Nome do Produto", text: $nomeProduto)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .border(.secondary)
            
            TextField("Descrição do Produto", text: $description)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .border(.secondary)
            
            TextField("Preço", text: $price)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .border(.secondary)
            TextField("Categoria", text: $category)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .border(.secondary)
            TextField("Imagem da Categoria", text: $categoryImage)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .border(.secondary)
            TextField("Serve quantas pessoas?", text: $serving)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .border(.secondary)
            
            Button{
                let productItem = Products(name: nomeProduto, description: description, price: Double(price)!, category: category, categoryImage: categoryImage, serving: serving, tentReference: CKRecord.Reference(recordID: tent.id!, action: .none))
                Task{
                    do{
                        try await model.addProduct(product: productItem)
                    }
                    catch{
                        print("Error \(error.localizedDescription)")
                    }
                }
                
            }label: {
                Text("Cadastrar Produto")
                    .padding()
                    .foregroundColor(.blue)
                    .frame(width: 357)
                    .background(
                        RoundedRectangle(cornerRadius: 15,style: .continuous)
                            .fill(.blue.opacity(0.2)))
            }
        }
        .padding()
    }
}



