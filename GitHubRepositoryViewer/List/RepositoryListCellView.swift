import Foundation
import SwiftUI

struct RepositoryListCellView : View{
    var repository : Repository
    let screen: CGRect = UIScreen.main.bounds
    @State var image = Image("")
    var imageViewModel = ImageViewModel()
    @State private var showingSheet = false
    @State var languageColor : Color
    var body : some View{
        
        
        ZStack{
            Rectangle()
                .fill(Color.white)
                .cornerRadius(5)
                .frame(height: screen.height/7)
                .onTapGesture {
                    self.showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    ScrollView{
                        RepositoryDetailView(repository: repository,image: image,languageColor: languageColor)
                    }
                }
            
            
            HStack{
                image
                    .resizable()
                    .frame(width: 80,height: 80)
                    .padding(10)
                VStack(alignment: .leading){
                    Text("")
                    Text(repository.name ?? "")
                        .font(.system(size: 27)).bold()
                        .ignoresSafeArea()
                        .foregroundColor(languageColor)
                    Text(repository.full_name?.split(separator: "/")[0] ?? "unknown owner")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    CellsCountView(repository: repository)
                    ZStack{
                        Color(.gray).opacity(0.12).cornerRadius(5)
                        Text(repository.description ?? "")
                            .lineLimit(1)
                    }
                    
                    
                    
                }
                Spacer()
            }
            
        }
        .task{
            await imageViewModel.getImage(from: repository.owner?.avatar_url)
            if let unwrappedImage = imageViewModel.image{
                image = Image(uiImage: unwrappedImage)
            }
        }
    }
    
}


